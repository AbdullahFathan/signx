import 'package:flutter/material.dart';
import 'package:signx/features/account/presentation/account_page.dart';
import 'package:signx/features/ai_scan/presentation/ai_scan_page.dart';
import 'package:signx/features/bottom_navbar/presentation/bottom_navbar.dart';
import 'package:signx/features/home/presentation/home_page.dart';
import 'package:signx/features/login/presentation/login_page.dart';
import 'package:signx/features/register/presentation/register_page.dart';

class RouteGenerator {
  static String initialRoute = MainAppPage.route;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.route:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case RegisterPage.route:
        return MaterialPageRoute(builder: (context) => const RegisterPage());
      case MainAppPage.route:
        return MaterialPageRoute(builder: (context) => const MainAppPage());
      case HomePage.route:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case AccountPage.route:
        return MaterialPageRoute(builder: (context) => const AccountPage());
      case AiScanPage.route:
        return MaterialPageRoute(builder: (context) => const AiScanPage());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
