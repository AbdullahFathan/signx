import 'package:flutter/material.dart';
import 'package:signx/config/theme/resources/app_color.dart';
import 'package:signx/features/account/presentation/account_page.dart';
import 'package:signx/features/ai_scan/presentation/ai_scan_page.dart';
import 'package:signx/features/home/presentation/home_page.dart';

class MainAppPage extends StatefulWidget {
  static const String route = "/main-app";
  const MainAppPage({super.key});

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  List<Widget> pages = [HomePage(), AiScanPage(), AccountPage()];
  int index = 0;

  void onTap(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,

      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () => onTap(1),
        backgroundColor: AppColors.primaryVariantColror,
        child: const Icon(
          Icons.camera_alt_outlined,
          color: AppColors.whiteColor,
          size: 28,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        elevation: 5,
        padding: const EdgeInsets.symmetric(horizontal: 48),
        notchMargin: 9,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home_outlined, size: 28),
              onPressed: () => onTap(0),
            ),
            IconButton(
              icon: Icon(Icons.account_circle_outlined, size: 28),
              tooltip: "Home",
              onPressed: () => onTap(2),
            ),
          ],
        ),
      ),
    );
  }
}
