import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastHelper {
  static void showSuccess(BuildContext context, String message) {
    toastification.show(
      context: context,
      title: Text(message),
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 300),
      icon: const Icon(Icons.check_circle),
    );
  }

  static void showError(BuildContext context, String message) {
    toastification.show(
      context: context,
      title: Text(message),
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 300),
      icon: const Icon(Icons.error),
    );
  }
}
