import 'package:flutter/material.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final bool showBackIcon;
  const PrimaryAppBar({
    super.key,
    required this.text,
    this.textStyle,
    this.onPressed,
    this.showBackIcon = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBackIcon,
      centerTitle: true,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 8,
      title: Text(
        text,
        style: textStyle ?? const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
