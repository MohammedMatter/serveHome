import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

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

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    currentPassword = TextEditingController(text: currentPassword.text);
    newPassword = TextEditingController(text: newPassword.text);
    confirmNewPassword = TextEditingController(text: confirmNewPassword.text);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.w(context);
    final screenHeight = ScreenSize.h(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Change Password",
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: _key,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                children: [
                  _input("Current Password", currentPassword, screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                  _input("New Password", newPassword, screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                  _input("Confirm New Password", confirmNewPassword, screenWidth, screenHeight),
                  const Spacer(),
                  _saveBtn(screenWidth, screenHeight),
                ],
              ),
            ),
            Consumer<AuthViewModel>(
              builder: (context, provAuth, child) => provAuth.isLoading
                  ? Container(
                      color: Colors.black.withOpacity(0.3),
                      child: Center(
                        child: CircularProgressIndicator(color: AppColor.primary),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _input(
      String text,
      TextEditingController controller,
      double screenWidth,
      double screenHeight, {
        bool isPassword = true,
      }) {
    return Consumer<AuthViewModel>(
      builder: (context, provAuth, child) => TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: (value) {
          if (text == "Current Password" && value!.trim().isEmpty) {
            return "This field is required";
          } else if (text == "Current Password" &&
              provAuth.user!.password != value) {
            return "The current password is incorrect";
          }
          if (text == "New Password") {
            if (value!.isEmpty) return "Password is required";
            if (value == currentPassword.text) return "The new password cannot be the same as the old one";
            if (!passwordRegex.hasMatch(value)) return "Password must be at least 8 characters, include upper & lower case letters, a number and a special character";
          }
          if (text == "Confirm New Password" && value!.isEmpty) return "This field is required";
          if (text == "Confirm New Password" && value != newPassword.text) return "New password and confirm password do not match";

          return null;
        },
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(fontSize: screenWidth * 0.045, color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
            borderSide: BorderSide.none,
          ),
          errorMaxLines: 5,
        ),
      ),
    );
  }

  Widget _saveBtn(double screenWidth, double screenHeight) {
    return Consumer<AuthViewModel>(
      builder: (context, provAuth, child) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            if (_key.currentState!.validate()) {
              await provAuth.updatePassword(newPassword.text);
              GoRouter.of(context).pop();
            }
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenWidth * 0.04),
            ),
            backgroundColor: AppColor.primary,
          ),
          child: Text(
            "Update Password",
            style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
