import 'package:fpdart/fpdart.dart';
import 'package:signx/features/login/domain/entities/login_user.dart';
import 'package:signx/features/login/domain/repository/login_repository.dart';

class LoginUsecase {
  final LoginRepository _repository;

  LoginUsecase(this._repository);

  Future<Either<String, User>> loginByEmailPass(
    String email,
    String password,
  ) async {
    return _repository.loginByEmailPass(email, password);
  }

  Future<Either<String, User>> loginWithGoogle() async {
    throw UnimplementedError();
  }
}
