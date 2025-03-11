import 'package:flutter/material.dart';
import 'package:signx/config/theme/resources/app_color.dart';

enum PrimaryButtonShape { stadium, rounded }

enum PrimaryButtonType { filled, outlined }

class PrimaryButtonWidget extends StatelessWidget {
  final void Function() onTap;
  final PrimaryButtonShape shapeButton;
  final PrimaryButtonType buttonType;
  final String? text;
  final Color? buttonColor;
  final double height;
  final double width;
  final Widget? childButton;

  const PrimaryButtonWidget({
    super.key,
    required this.onTap,
    this.text,
    this.shapeButton = PrimaryButtonShape.rounded,
    this.buttonType = PrimaryButtonType.filled,
    this.buttonColor = AppColors.primaryColor,
    this.height = 48,
    this.width = double.infinity,
    this.childButton,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor:
              buttonType == PrimaryButtonType.filled
                  ? buttonColor
                  : Colors.transparent,
          side:
              buttonType == PrimaryButtonType.outlined
                  ? BorderSide(
                    width: 1,
                    color: buttonColor ?? AppColors.primaryColor,
                  )
                  : BorderSide.none,
          shape:
              shapeButton == PrimaryButtonShape.rounded
                  ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                  : const StadiumBorder(),
        ),
        child:
            childButton ??
            Text(
              "$text",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color:
                    buttonType == PrimaryButtonType.filled
                        ? AppColors.whiteColor
                        : buttonColor ?? AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }
}
