import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:signx/features/ai_scan/domain/entities/sign_leter.dart';

abstract class AiScanRepo {
  Future<Either<String, SignLetter>> classifySignFromImage(File imageFile);
}
