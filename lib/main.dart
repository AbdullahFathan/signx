import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signx/config/routes/app_route.dart';
import 'package:signx/config/theme/app_theme.dart';
import 'package:signx/features/account/presentation/cubit/account_cubit.dart';
import 'package:signx/features/login/presentation/cubit/login_cubit.dart';
import 'package:signx/features/register/presentation/cubit/register_cubit.dart';
import 'package:signx/firebase_options.dart';
import 'package:signx/injection_container.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDepenencied();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit(sl())),
        BlocProvider(create: (context) => LoginCubit(sl())),
        BlocProvider(create: (context) => AccountCubit(sl())..getUserData()),
      ],
      child: MaterialApp(
        initialRoute: RouteGenerator.initialRoute,
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        theme: ThemeClass.lightTheme,
      ),
    );
  }
}
