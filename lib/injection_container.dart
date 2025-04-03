import 'package:get_it/get_it.dart';
import 'package:signx/features/register/data/data_source/remote/register_services.dart';
import 'package:signx/features/register/data/repository/register_repository_impl.dart';
import 'package:signx/features/register/domain/repository/register_repository.dart';
import 'package:signx/features/register/domain/usecase/register_usecase.dart';
import 'package:signx/features/register/presentation/cubit/register_cubit.dart';

final sl = GetIt.instance;

Future<void> initializeDepenencied() async {
  //Register
  sl.registerSingleton<RegisterServices>(RegisterServices());
  sl.registerSingleton<RegisterRepository>(RegisterRepositoryImpl(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl()));
}
