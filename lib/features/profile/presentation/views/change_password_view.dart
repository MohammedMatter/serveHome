import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            _input("Current Password", isPassword: true),
            const SizedBox(height: 15),

            _input("New Password", isPassword: true),
            const SizedBox(height: 15),

            _input("Confirm New Password", isPassword: true),

            const Spacer(),

            _saveBtn(),
          ],
        ),
      ),
    );
  }

  Widget _input(String text, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: text,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _saveBtn() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text("Update Password",
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
