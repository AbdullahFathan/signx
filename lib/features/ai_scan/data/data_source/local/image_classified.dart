// ignore_for_file: unused_field

import 'dart:io';
import 'dart:typed_data';
import 'package:fpdart/fpdart.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

class TFLiteLocalDataSource {
  final Interpreter interpreter;
  final List<int> _inputShape;
  final List<int> _outputShape;
  final TensorType _inputType;
  final TensorType _outputType;

  TFLiteLocalDataSource(this.interpreter)
    : _inputShape = interpreter.getInputTensor(0).shape,
      _outputShape = interpreter.getOutputTensor(0).shape,
      _inputType = interpreter.getInputTensor(0).type,
      _outputType = interpreter.getOutputTensor(0).type;

  Future<Either<String, int>> classifyImage(File imageFile) async {
    try {
      // Decode image
      final rawBytes = await imageFile.readAsBytes();
      final image = img.decodeImage(rawBytes)!;
      final resized = img.copyResize(image, width: 96, height: 96);
      final inputShape = interpreter.getInputTensor(0).shape;
      final outputShape = interpreter.getOutputTensor(0).shape;

      // Create input tensor buffer with the correct shape
      final input = Float32List(1 * 96 * 96 * 3);
      int index = 0;
      for (int y = 0; y < 96; y++) {
        for (int x = 0; x < 96; x++) {
          final pixel = resized.getPixel(x, y);
          input[index++] = pixel.r / 255.0;
          input[index++] = pixel.g / 255.0;
          input[index++] = pixel.b / 255.0;
        }
      }

      // Allocate tensors before running inference
      interpreter.allocateTensors();

      // Set the input tensor
      final inputTensor = interpreter.getInputTensor(0);
      if (inputTensor.shape.toList() != [1, 96, 96, 3]) {
        // Reshape the input if the model expects a 4D tensor
        final reshapedInput = input.reshape([1, 96, 96, 3]);
        inputTensor.setTo(reshapedInput); // Use setTo instead of copyFrom
      } else {
        inputTensor.setTo(input); // Use setTo instead of copyFrom
      }

      // Create output buffer with the correct shape
      final output = Float32List(outputShape.reduce((a, b) => a * b));

      // Run inference
      interpreter.run(inputTensor.data.buffer, output.buffer);

      // Find the index of the highest probability
      int maxIndex = 0;
      double maxValue = -double.infinity;
      for (int i = 0; i < output.length; i++) {
        if (output[i] > maxValue) {
          maxValue = output[i];
          maxIndex = i;
        }
      }

      return Right(maxIndex);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
