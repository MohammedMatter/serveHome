import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/utils/input_validator.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';

class ChangePasswordView extends StatefulWidget {
  ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  TextEditingController currentPassword = TextEditingController();

  TextEditingController newPassword = TextEditingController();

  TextEditingController confirmNewPassword = TextEditingController();
    static final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPassword = TextEditingController(text: currentPassword.text);

    newPassword = TextEditingController(text: newPassword.text);

    confirmNewPassword = TextEditingController(text: confirmNewPassword.text);
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Change Password"),
      ),
      body: Form(
        key: _key,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _input("Current Password", currentPassword, isPassword: true),
                  const SizedBox(height: 15),

                  _input("New Password", newPassword, isPassword: true),
                  const SizedBox(height: 15),

                  _input(
                    "Confirm New Password",
                    confirmNewPassword,
                    isPassword: true,
                  ),

                  const Spacer(),

                  _saveBtn(),
                ],
              ),
            ),
            Consumer<AuthViewModel>(
              builder:
                  (context, provAuth, child) => Center(
                    child:
                        provAuth.isLoading
                            ? CircularProgressIndicator(color: AppColor.primary)
                            : SizedBox.shrink(),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _input(
    String text,
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return Consumer<AuthViewModel>(
      builder:
          (context, provAuth, child) => TextFormField(
            validator: (value) {
              if (currentPassword.text.trim().isEmpty &&
                  text == 'Current Password') {
                return 'This field is required';
              } else if (provAuth.user!.password != currentPassword.text &&
                  text == 'Current Password') {
                return 'The current password is incorrect.';
              }

              if (text == 'New Password') {
                if (newPassword.text.isEmpty) {
                  return 'Password is required';
                } 
                else if (currentPassword.text == newPassword.text &&
                  text == 'New Password') {
                return 'The new password cannot be the same as the old one.';
              }
                
                else if (!passwordRegex.hasMatch(newPassword.text)) {
                  return 'Password must be at least 8 characters, include upper & lower case letters, a number and a special character';
                } else {
                  return null;
                }
                
              }
              if (confirmNewPassword.text.trim().isEmpty &&
                  text == 'Confirm New Password') {
                return 'This field is required';
              } else if (newPassword.text != confirmNewPassword.text &&
                  text == 'Confirm New Password') {
                return 'New password and confirm password do not match.';
              }

              return null;
            },
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.black),
              errorMaxLines: 10,
              labelText: text,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
    );
  }

  Widget _saveBtn() {
    return Consumer<AuthViewModel>(
      builder:
          (context, provAuth, child) => SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                if (_key.currentState!.validate()) {
                  await provAuth.updatePassword(newPassword.text);
                  GoRouter.of(context).pop();
                }
              },
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 16),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(AppColor.primary),
              ),
              child: Text(
                "Update Password",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
    );
  }
}
