import 'package:bloc/bloc.dart';
import 'package:signx/core/state/base_state.dart';
import 'package:signx/features/account/domain/entities/account_user.dart';
import 'package:signx/features/account/domain/use_case/account_usecase.dart';

class AccountCubit extends Cubit<BaseState<AccountUser>> {
  final AccountUseCase _useCase;
  AccountCubit(this._useCase) : super(BaseState.initial());

  void getUserData() async {
    emit(state.copyWith(status: BaseStatus.loading));

    var res = await _useCase.getUserProfile();

    res.fold(
      (eror) => emit(state.copyWith(status: BaseStatus.error, error: eror)),
      (userData) =>
          emit(state.copyWith(status: BaseStatus.success, data: userData)),
    );
  }

  void logout() async {
    emit(state.copyWith(status: BaseStatus.loading));
    var res = await _useCase.logout();

    res.fold(
      (eror) => emit(state.copyWith(status: BaseStatus.error, error: eror)),
      (data) {
        emit(state.copyWith(status: BaseStatus.success, data: null));
      },
    );
  }
}
