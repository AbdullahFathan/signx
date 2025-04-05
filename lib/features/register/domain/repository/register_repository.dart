import 'package:fpdart/fpdart.dart';

import '../entities/register_user.dart';

abstract class RegisterRepository {
  Future<Either<String, User>> registerUser(String email, String password);
}
