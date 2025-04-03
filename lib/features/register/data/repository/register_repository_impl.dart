import 'package:fpdart/fpdart.dart';
import 'package:signx/features/register/data/data_source/remote/register_services.dart';
import 'package:signx/features/register/domain/entities/register_user.dart';
import 'package:signx/features/register/domain/repository/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  RegisterRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<String, User>> registerUser(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await authRemoteDataSource
          .registerWithEmailAndPassword(email, password);
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
