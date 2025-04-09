import 'package:get_it/get_it.dart';
import 'package:signx/features/account/data/data_source/local/account_services.dart';
import 'package:signx/features/account/data/data_source/remote/firebase_services.dart';
import 'package:signx/features/account/data/repository/account_repo_impl.dart';
import 'package:signx/features/account/domain/repository/account_repo.dart';
import 'package:signx/features/account/domain/use_case/account_usecase.dart';
import 'package:signx/features/account/presentation/cubit/account_cubit.dart';
import 'package:signx/features/ai_scan/data/data_source/local/image_classified.dart';
import 'package:signx/features/ai_scan/data/repository/ai_scan_repo_impl.dart';
import 'package:signx/features/ai_scan/domain/repository/ai_scan_repo.dart';
import 'package:signx/features/ai_scan/domain/usecase/ai_scan_usecase.dart';
import 'package:signx/features/ai_scan/presentation/cubit/ai_scan_cubit.dart';
import 'package:signx/features/login/data/data_source/remote/login_services.dart';
import 'package:signx/features/login/data/repository/login_repo_imp.dart';
import 'package:signx/features/login/domain/repository/login_repository.dart';
import 'package:signx/features/login/domain/usecase/login_usecase.dart';
import 'package:signx/features/login/presentation/cubit/login_cubit.dart';
import 'package:signx/features/register/data/data_source/remote/register_services.dart';
import 'package:signx/features/register/data/repository/register_repository_impl.dart';
import 'package:signx/features/register/domain/repository/register_repository.dart';
import 'package:signx/features/register/domain/usecase/register_usecase.dart';
import 'package:signx/features/register/presentation/cubit/register_cubit.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

final sl = GetIt.instance;

Future<void> initializeDepenencied() async {
  //Register
  sl.registerSingleton<RegisterServices>(RegisterServices());
  sl.registerSingleton<RegisterRepository>(RegisterRepositoryImpl(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl()));

  //Login
  sl.registerSingleton<LoginServices>(LoginServices());
  sl.registerSingleton<LoginRepository>(LoginRepoImp(sl()));
  sl.registerSingleton<LoginUsecase>(LoginUsecase(sl()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));

  //Account
  sl.registerSingleton<AccountServices>(AccountServices());
  sl.registerSingleton<FirebaseServices>(FirebaseServices());
  sl.registerSingleton<AccountRepo>(
    AccountRepoImpl(sl<AccountServices>(), sl<FirebaseServices>()),
  );
  sl.registerSingleton<AccountUseCase>(AccountUseCase(sl()));
  sl.registerFactory<AccountCubit>(() => AccountCubit(sl()));

  //Ai-scan Page
  final interpreter = await Interpreter.fromAsset('assets/model/model.tflite');
  sl.registerSingleton<Interpreter>(interpreter);
  sl.registerSingleton<TFLiteLocalDataSource>(TFLiteLocalDataSource(sl()));
  sl.registerSingleton<AiScanRepo>(AiScanRepoImpl(sl()));
  sl.registerSingleton<AiScanUsecase>(AiScanUsecase(sl()));
  sl.registerFactory<AiScanCubit>(() => AiScanCubit(sl()));
}
