import 'package:fpdart/fpdart.dart';
import 'package:signx/features/account/domain/entities/account_user.dart';

abstract class AccountRepo {
  Future<Either<String, AccountUser>> getUserProfile();
  Future<Either<String, String>> logout();
}
