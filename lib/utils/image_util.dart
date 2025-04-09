import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class ImageUtils {
  static Future<Either<String, File?>> convertCameraImageToFile(
    CameraImage cameraImage,
  ) async {
    try {
      if (cameraImage.format.group == ImageFormatGroup.yuv420) {
        final plane = cameraImage.planes.first;
        final bytes = plane.bytes;
        final width = cameraImage.width;
        final height = cameraImage.height;
        final uvRowStride = cameraImage.planes[1].bytesPerRow;
        final uvPixelStride = cameraImage.planes[1].bytesPerPixel!;

        final imgLib = img.Image(width: width, height: height);

        for (int x = 0; x < width; x++) {
          for (int y = 0; y < height; y++) {
            final int uvIndex =
                uvPixelStride * (x ~/ 2) + uvRowStride * (y ~/ 2);
            final int index = y * width + x;

            final yPixel = bytes[index];
            final vPixel = cameraImage.planes[2].bytes[uvIndex];
            final uPixel = cameraImage.planes[1].bytes[uvIndex];

            final r = (yPixel + vPixel * 1436 / 1024 - 179).round().clamp(
              0,
              255,
            );
            final g = (yPixel -
                    uPixel * 46549 / 131072 +
                    44 -
                    vPixel * 93604 / 131072 +
                    91)
                .round()
                .clamp(0, 255);
            final b = (yPixel + uPixel * 1814 / 1024 - 227).round().clamp(
              0,
              255,
            );

            imgLib.setPixelRgba(x, y, r, g, b, 255);
          }
        }

        final directory = await getTemporaryDirectory();
        final file = File('${directory.path}/converted_image.jpg');
        await file.writeAsBytes(img.encodeJpg(imgLib));
        return Right(file);
      }
      return const Left("Format gambar tidak didukung");
    } catch (e) {
      return Left("Gagal mengonversi CameraImage ke File: $e");
    }
  }

  static Future<Either<String, Float32List>> prepareImageForTFLite(
    File imageFile,
    int width,
    int height,
  ) async {
    try {
      final rawBytes = await imageFile.readAsBytes();
      final image = img.decodeImage(rawBytes)!;
      final resized = img.copyResize(image, width: width, height: height);

      final input = Float32List(1 * width * height * 3);
      int index = 0;
      for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
          final pixel = resized.getPixel(x, y);
          input[index++] = pixel.r / 255.0;
          input[index++] = pixel.g / 255.0;
          input[index++] = pixel.b / 255.0;
        }
      }
      return Right(input);
    } catch (e) {
      return Left("Gagal mempersiapkan gambar untuk TFLite: $e");
    }
  }
}
