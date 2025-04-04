import 'package:fpdart/fpdart.dart';
import 'package:signx/features/login/data/data_source/remote/login_services.dart';
import 'package:signx/features/login/domain/entities/login_user.dart';
import 'package:signx/features/login/domain/repository/login_repository.dart';

class LoginRepoImp extends LoginRepository {
  final LoginServices _services;

  LoginRepoImp(this._services);
  @override
  Future<Either<String, User>> loginByEmailPass(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _services.loginWithEmailAndPassword(
        email,
        password,
      );
      final user = User(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email!,
      );
      return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
