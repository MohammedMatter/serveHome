
import 'package:flutter/material.dart';
import 'package:serve_home/core/styles/app_style.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.zero,
          ),
        ),
        onPressed: () {},
        child: Text(
          'Forgot Password ?',
          style: AppStyle.body19.copyWith(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
