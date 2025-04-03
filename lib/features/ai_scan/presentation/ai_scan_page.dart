import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:signx/main.dart';
import 'package:signx/widgets/primary_appbar.dart';

class AiScanPage extends StatefulWidget {
  static const String route = "/ai-scan";
  const AiScanPage({super.key});

  @override
  State<AiScanPage> createState() => _AiScanPageState();
}

class _AiScanPageState extends State<AiScanPage> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller
        .initialize()
        .then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        })
        .catchError((Object e) {
          if (e is CameraException) {
            switch (e.code) {
              case 'CameraAccessDenied':
                // Handle access errors here.
                break;
              default:
                // Handle other errors here.
                break;
            }
          }
        });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                child: childCamera(),
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

  Widget childCamera() {
    if (!controller.value.isInitialized) {
      return Center(
        child: Text(
          "Kamera Tidak Bisa Diakses",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
        ),
      );
    }
    return CameraPreview(controller);
  }
}
