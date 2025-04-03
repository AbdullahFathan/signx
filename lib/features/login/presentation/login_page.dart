import 'package:flutter/material.dart';
import 'package:signx/config/theme/resources/app_color.dart';
import 'package:signx/features/register/presentation/register_page.dart';
import 'package:signx/widgets/email_text_form.dart';
import 'package:signx/widgets/password_text_form.dart';
import 'package:signx/widgets/primary_button.dart';

class LoginPage extends StatefulWidget {
  static const String route = "/login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics:
                  constraints.maxHeight >
                          MediaQuery.of(context).size.height * 0.6
                      ? NeverScrollableScrollPhysics()
                      : null,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
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
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(fontSize: 12),
                              ),
                            ),

                            EmailTextFormWidget(controller: emailController),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 5,
                              ),
                              child: Text(
                                "Password",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(fontSize: 12),
                              ),
                            ),
                            PasswordTextFormWidget(
                              controller: passwordController,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 22,
                                bottom: 7,
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap:
                                      () => Navigator.pushNamed(
                                        context,
                                        RegisterPage.route,
                                      ),
                                  child: Text(
                                    "Belum punya Akun? Register Yuuk",
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 36,
                                bottom: 12,
                              ),
                              child: PrimaryButtonWidget(
                                text: "Login",
                                shapeButton: PrimaryButtonShape.stadium,
                                buttonType: PrimaryButtonType.filled,
                                onTap: () {},
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Divider(color: AppColors.hintColor),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25,
                                bottom: 12,
                              ),
                              child: PrimaryButtonWidget(
                                shapeButton: PrimaryButtonShape.stadium,
                                buttonType: PrimaryButtonType.outlined,
                                onTap: () {},
                                childButton: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/800px-Google_%22G%22_logo.svg.png",
                                      width: 27,
                                      height: 27,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      "Akun Google",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
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
      ),
    );
  }
}
