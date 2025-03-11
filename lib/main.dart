import 'package:flutter/material.dart';
import 'package:signx/config/routes/app_route.dart';
import 'package:signx/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteGenerator.initialRoute,
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      theme: ThemeClass.lightTheme,
    );
  }
}
