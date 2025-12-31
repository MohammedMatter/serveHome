import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';

class SignInButtonWidget extends StatelessWidget {
  const SignInButtonWidget({
    super.key,
    required this.password,
    required this.email,
    required this.keyForm,
  });

  final GlobalKey<FormState> keyForm;
  final TextEditingController password;
  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder:
          (context, provAuth, child) => Center(
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  backgroundColor: WidgetStatePropertyAll(AppColor.primary),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                onPressed:
                    provAuth.isLoading || provAuth.errorMessage.isNotEmpty
                        ? null
                        : () async {
                          log('I am here');
                          if (keyForm.currentState!.validate()) {
                            await provAuth.signIn(
                              password: password.text,
                              email: email.text,
                              onSuccess: () {
                                GoRouter.of(
                                  context,
                                ).pushNamed(AppRouter.homeView);
                              },
                            );

                            if (provAuth.errorMessage.isNotEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        provAuth.errorMessage,
                                        style: AppStyle.button,
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  )
                                  .closed
                                  .then((value) {
                                    provAuth.errorMessage = '';
                                    provAuth.isLoading = false;
                                    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                                    provAuth.notifyListeners();
                                  });
                            }
                          }
                        },
                child: Text('Sign In'),
              ),
            ),
          ),
    );
  }
}
