import 'package:flutter/material.dart';
import 'package:signx/config/theme/resources/app_color.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  const LoadingWidget({super.key, this.color = AppColors.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: color));
  }
}
