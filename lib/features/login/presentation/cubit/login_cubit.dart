import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:signx/core/state/base_state.dart';
import 'package:signx/features/login/domain/entities/login_user.dart';
import 'package:signx/features/login/domain/usecase/login_usecase.dart';

class LoginCubit extends Cubit<BaseState<User>> {
  final LoginUsecase _usecase;
  LoginCubit(this._usecase) : super(BaseState.initial());

  void loginByEmailPass(String email, String password) async {
    emit(state.copyWith(status: BaseStatus.success));

    var res = await _usecase.loginByEmailPass(email, password);

    res.fold(
      (eror) => emit(state.copyWith(status: BaseStatus.error, error: eror)),
      (user) {
        emit(state.copyWith(status: BaseStatus.success, data: user));
      },
    );
  }

  void loginByGoogle() async {
    emit(state.copyWith(status: BaseStatus.loading));
    var res = await _usecase.loginWithGoogle();
    res.fold(
      (eror) => emit(state.copyWith(status: BaseStatus.error, error: eror)),
      (user) {
        emit(state.copyWith(status: BaseStatus.success, data: user));
        log("Data user = ${user.email}");
      },
    );
  }
}
