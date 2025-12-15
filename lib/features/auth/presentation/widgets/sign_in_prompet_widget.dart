
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/router/app_router.dart';

class SignInPrompetWidget extends StatelessWidget {
  const SignInPrompetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account ?'),
        TextButton(
          onPressed: () {
            GoRouter.of(
              context,
            ).pushNamed(AppRouter.signUpView);
          },
          child: Text(
            'Sign Up',
            style: TextStyle(color: AppColor.primary),
          ),
        ),
      ],
    );
  }
}
