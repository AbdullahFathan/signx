import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signx/features/ai_scan/presentation/cubit/ai_scan_cubit.dart';
import 'package:signx/features/ai_scan/presentation/cubit/ai_scan_state.dart';
import 'package:signx/widgets/primary_appbar.dart';

import '../../../../main.dart';

class AiScanPage extends StatefulWidget {
  static const String route = "/ai-scan";
  const AiScanPage({super.key});

  @override
  State<AiScanPage> createState() => _AiScanPageState();
}

class _AiScanPageState extends State<AiScanPage> {
  late CameraController controller;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      if (cameras.isNotEmpty) {
        controller = CameraController(
          cameras[0],
          ResolutionPreset.medium,
          imageFormatGroup: ImageFormatGroup.yuv420,
        );
        await controller.initialize();
        if (mounted) {
          setState(() {
            _isCameraInitialized = true;
          });
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Tidak ada kamera tersedia.')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menginisialisasi kamera: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    if (_isCameraInitialized) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _cameraPreviewWidget() {
    if (_isCameraInitialized) {
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller),
      );
    } else {
      return const Center(child: Text('Menginisialisasi Kamera...'));
    }
  }

  Future<void> _classifyFrame() async {
    if (_isCameraInitialized &&
        controller.value.isInitialized &&
        !controller.value.isTakingPicture) {
      try {
        final XFile image = await controller.takePicture();
        if (mounted) {
          BlocProvider.of<AiScanCubit>(
            context,
          ).classifySingleFrame(File(image.path));
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Gagal mengambil gambar: $e')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(text: "AI SCAN"),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AiScanCubit, AiScanState>(
              builder: (context, state) {
                String predictedText = "Prediksi: ";
                if (state is AiScanPredictionLoaded) {
                  predictedText += state.signLetter.letter;
                } else if (state is AiScanPredictionError) {
                  predictedText = "Error: ${state.message}";
                } else if (state is AiScanPredictionLoading) {
                  predictedText = "Menganalisis...";
                }
                return Text(
                  predictedText,
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge?.copyWith(fontSize: 20),
                );
              },
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                width: double.infinity,
                child: _cameraPreviewWidget(),
              ),
            ),
            const Text(
              "Letakan Tangan agar terlihat oleh kamera",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _classifyFrame,
              child: const Text('Klasifikasi'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
