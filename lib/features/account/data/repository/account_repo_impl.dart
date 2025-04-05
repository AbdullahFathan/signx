import 'package:fpdart/fpdart.dart';
import 'package:signx/features/account/data/data_source/local/account_services.dart';
import 'package:signx/features/account/domain/entities/account_user.dart';
import 'package:signx/features/account/domain/repository/account_repo.dart';

class AccountRepoImpl implements AccountRepo {
  final AccountServices _services;

  AccountRepoImpl(this._services);
  @override
  Future<Either<String, AccountUser>> getUserProfile() async {
    try {
      var res = await _services.getUserData();

      if (res == null) return Left("data user null");
      return Right(res);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
