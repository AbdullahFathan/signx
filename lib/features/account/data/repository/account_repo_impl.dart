import 'package:fpdart/fpdart.dart';
import 'package:signx/features/account/data/data_source/local/account_services.dart';
import 'package:signx/features/account/data/data_source/remote/firebase_services.dart';
import 'package:signx/features/account/domain/entities/account_user.dart';
import 'package:signx/features/account/domain/repository/account_repo.dart';

class AccountRepoImpl implements AccountRepo {
  final AccountServices _services;
  final FirebaseServices _firebaseServices;

  AccountRepoImpl(this._services, this._firebaseServices);
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

  @override
  Future<Either<String, String>> logout() async {
    try {
      await _firebaseServices.logout();
      return Right("Succes Logout");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
