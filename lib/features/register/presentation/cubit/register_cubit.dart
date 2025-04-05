import 'package:bloc/bloc.dart';
import 'package:signx/core/state/base_state.dart';
import 'package:signx/features/register/domain/entities/register_user.dart';
import 'package:signx/features/register/domain/usecase/register_usecase.dart';

class RegisterCubit extends Cubit<BaseState<User>> {
  final RegisterUseCase _registerUseCase;
  RegisterCubit(this._registerUseCase) : super(BaseState<User>.initial());

  void registerUser(String email, password) async {
    emit(state.copyWith(status: BaseStatus.loading));
    var res = await _registerUseCase.call(email, password);

    res.fold(
      (eror) => emit(state.copyWith(status: BaseStatus.error, error: eror)),
      (user) {
        emit(state.copyWith(status: BaseStatus.success, data: user));
      },
    );
  }
}
