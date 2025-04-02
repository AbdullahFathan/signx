import 'package:flutter/material.dart';
import 'package:signx/config/theme/resources/app_color.dart';
import 'package:signx/widgets/primary_appbar.dart';

class AiScanPage extends StatelessWidget {
  static const String route = "/ai-scan";
  const AiScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(text: "AI SCAN"),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Prediksi: A",
              style: Theme.of(
                context,
              ).textTheme.displayLarge?.copyWith(fontSize: 20),
            ),

            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                width: double.infinity,
                color: AppColors.primaryVariantColror,
              ),
            ),
            Text(
              "Letakan Tangan agar terlihat oleh kamera",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
