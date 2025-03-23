import 'package:flutter/material.dart';
import 'package:signx/config/theme/resources/app_color.dart';
import 'package:signx/widgets/primary_appbar.dart';
import 'package:signx/widgets/primary_button.dart';

class AccountPage extends StatelessWidget {
  static const String route = "/account";
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> accountServices = [
      "Informasi Akun",
      "Ganti Password",
      "Tampilan",
    ];
    return Scaffold(
      appBar: PrimaryAppBar(text: "Account", showBackIcon: false),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          children: [
            const SizedBox(height: 25),
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.bordeColor,
                  child: Icon(Icons.person_2, size: 32),
                ),
                const SizedBox(width: 15),
                Text(
                  "Abdullah Fathan",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 32, bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.bordeColor, width: 1),
              ),
              child: Column(
                children:
                    accountServices
                        .map(
                          (item) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios_outlined),
                              ),
                            ],
                          ),
                        )
                        .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: PrimaryButtonWidget(onTap: () {}, text: "Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
