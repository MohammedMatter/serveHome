import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:serve_home/features/auth/presentation/widgets/sign_in_button_widget.dart';
import 'package:serve_home/features/auth/presentation/widgets/sign_in_prompet_widget.dart';
import 'package:serve_home/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:serve_home/features/auth/presentation/widgets/welcome_sign_in_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      body: Form(
        key: _key,
        child: Consumer<AuthViewModel>(
          builder:
              (context, provAuth, child) => Stack(
                children: [
                  WelcomeSignInWidget(),
                  Center(
                    child: SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenSize.w(context) * 0.05,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenSize.w(context) * 0.08,
                          vertical: ScreenSize.h(context) * 0.02,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.black12,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 500),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormFieldWidget(
                                contoller: email,
                                hintText: 'Enter your address',
                                icon: Icons.email,
                                label: 'Email',
                                isSignIn: true,
                              ),
                              SizedBox(height: ScreenSize.h(context) * 0.02),
                              TextFormFieldWidget(
                                isSignIn: true,
                                contoller: password,
                                hintText: 'Enter your password',
                                icon: Icons.password,
                                label: 'Password',
                              ),
                              SizedBox(height: ScreenSize.h(context) * 0.04),
                              SignInButtonWidget(
                                password: password,
                                email: email,
                                keyForm: _key,
                              ),

                              SignInPrompetWidget(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  if (provAuth.isLoading)
                    Container(
                      color: Colors.black45,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                ],
              ),
        ),
      ),
    );
  }
}
