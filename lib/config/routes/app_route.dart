import 'package:flutter/material.dart';
import 'package:signx/features/login/presentation/login_page.dart';

class RouteGenerator {
  static String initialRoute = LoginPage.route;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.route:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
