import 'package:fpdart/fpdart.dart';
import 'package:signx/features/account/domain/entities/account_user.dart';
import 'package:signx/features/account/domain/repository/account_repo.dart';

class AccountUseCase {
  final AccountRepo _repo;

  AccountUseCase(this._repo);

  Future<Either<String, AccountUser>> getUserProfile() async {
    return _repo.getUserProfile();
  }
}
