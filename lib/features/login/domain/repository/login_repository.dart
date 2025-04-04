import 'package:fpdart/fpdart.dart';
import 'package:signx/features/login/domain/entities/login_user.dart';

abstract class LoginRepository {
  Future<Either<String, User>> loginByEmailPass(String email, String password);
}
