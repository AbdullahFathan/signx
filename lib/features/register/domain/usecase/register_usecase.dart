import 'package:fpdart/fpdart.dart';
import 'package:signx/features/register/domain/repository/register_repository.dart';

import '../entities/register_user.dart';

class RegisterUseCase {
  final RegisterRepository _repository;

  RegisterUseCase(this._repository);

  Future<Either<String, User>> call(String email, String password) async {
    return _repository.registerUser(email, password);
  }
}
