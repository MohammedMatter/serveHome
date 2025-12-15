
import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/utils/input_validator.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    super.key,
    required this.contoller,
    required this.hintText,
    required this.icon,
    required this.label,
    required this.isSignIn,
  });

  final TextEditingController contoller;
  String hintText;
  IconData icon;
  String label;
  bool isSignIn;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 3),
        TextFormField(
          validator: (value) {
            if (label == 'Email' && isSignIn) {
              return InputValidator.vaildateEmailSignIn(value!);
            }
            if (label == 'Password' && isSignIn) {
              return InputValidator.vaildatePassSignIn(value!);
            }
            if (label == 'Name' && !isSignIn) {
              return InputValidator.vaildateNameSignUp(value!);
            }
            if (label == 'Email' && !isSignIn) {
              return InputValidator.vaildateEmailSignUp(value!);
            }
            if (label == 'Password' && !isSignIn) {
              return InputValidator.vaildatePassSignUp(value!);
            }
            if (label == 'PhoneNumber' && !isSignIn) {
              return InputValidator.vaildatePhoneSignUp(value!);
            }
            return null;
          },
          controller: contoller,
          decoration: InputDecoration(
            filled: true,
            prefixIcon: Icon(icon, color: Colors.grey),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: AppColor.filledTextField,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
          ),
        ),
      ],
    );
  }
}
