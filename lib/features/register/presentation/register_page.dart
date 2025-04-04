import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signx/config/theme/resources/app_color.dart';
import 'package:signx/core/state/base_state.dart';
import 'package:signx/features/bottom_navbar/presentation/bottom_navbar.dart';
import 'package:signx/features/register/domain/entities/register_user.dart';
import 'package:signx/features/register/presentation/cubit/register_cubit.dart';
import 'package:signx/widgets/email_text_form.dart';
import 'package:signx/widgets/loading_widget.dart';
import 'package:signx/widgets/password_text_form.dart';
import 'package:signx/widgets/primary_button.dart';
import 'package:signx/widgets/toast_helper.dart';

class RegisterPage extends StatefulWidget {
  static const String route = "/register";
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocConsumer<RegisterCubit, BaseState<User>>(
        listener: (context, state) {
          if (state.status == BaseStatus.error) {
            ToastHelper.showError(context, state.error);
          } else if (state.status == BaseStatus.success) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              MainAppPage.route,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state.status == BaseStatus.loading) {
            return LoadingWidget(color: AppColors.whiteColor);
          }
          return SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics:
                      constraints.maxHeight >
                              MediaQuery.of(context).size.height * 0.6
                          ? NeverScrollableScrollPhysics()
                          : null,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 80),
                          child: Center(
                            child: Text(
                              "SIGNX",
                              style: Theme.of(
                                context,
                              ).textTheme.displayLarge?.copyWith(
                                color: AppColors.whiteColor,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height,
                          padding: const EdgeInsets.symmetric(
                            vertical: 32,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 35,
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    "Email",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontSize: 12),
                                  ),
                                ),

                                EmailTextFormWidget(
                                  controller: emailController,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15,
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    "Password",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontSize: 12),
                                  ),
                                ),
                                PasswordTextFormWidget(
                                  controller: passwordController,
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15,
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    "Konfimasi Password",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontSize: 12),
                                  ),
                                ),
                                PasswordTextFormWidget(
                                  controller: confirmPassController,
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 36,
                                    bottom: 12,
                                  ),
                                  child: PrimaryButtonWidget(
                                    text: "Register",
                                    shapeButton: PrimaryButtonShape.stadium,
                                    buttonType: PrimaryButtonType.filled,
                                    onTap: () {
                                      context
                                          .read<RegisterCubit>()
                                          .registerUser(
                                            emailController.text,
                                            passwordController.text,
                                          );
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  child: Divider(color: AppColors.hintColor),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Sudah Punya Akun?",
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
