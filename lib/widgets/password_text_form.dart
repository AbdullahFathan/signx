import 'package:flutter/material.dart';
import 'package:signx/config/theme/resources/app_color.dart';

class PasswordTextFormWidget extends StatefulWidget {
  final TextEditingController controller;
  const PasswordTextFormWidget({super.key, required this.controller});

  @override
  State<PasswordTextFormWidget> createState() => _PasswordTextFormWidgetState();
}

class _PasswordTextFormWidgetState extends State<PasswordTextFormWidget> {
  bool isObsucre = true;
  void handelObsucre() {
    setState(() {
      isObsucre = !isObsucre;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isObsucre,

      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(isObsucre ? Icons.lock_outline : Icons.lock_open),
          color: AppColors.hintColor,
          onPressed: () => handelObsucre(),
        ),
        hintText: "Password",
        border: Theme.of(context).inputDecorationTheme.border,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        focusedErrorBorder:
            Theme.of(context).inputDecorationTheme.focusedErrorBorder,
      ),
    );
  }
}
