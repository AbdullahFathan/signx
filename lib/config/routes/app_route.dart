import 'package:flutter/material.dart';
import 'package:signx/features/login/presentation/login_page.dart';
import 'package:signx/features/register/presentation/register_page.dart';

class RouteGenerator {
  static String initialRoute = LoginPage.route;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.route:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case RegisterPage.route:
        return MaterialPageRoute(builder: (context) => const RegisterPage());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
