import 'package:bloc/bloc.dart';
import 'package:signx/features/register/domain/entities/register_user.dart';
import 'package:signx/features/register/domain/usecase/register_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;
  RegisterCubit(this._registerUseCase) : super(RegisterState.initial());

  void registerUser(String email, password) async {
    emit(state.copyWith(status: RegisterStatus.loading));
    var res = await _registerUseCase.call(email, password);

    res.fold(
      (eror) => emit(state.copyWith(status: RegisterStatus.eror, eror: eror)),
      (user) {
        emit(state.copyWith(status: RegisterStatus.success, data: user));
      },
    );
  }
}
