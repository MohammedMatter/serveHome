import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:serve_home/features/auth/presentation/widgets/google_button_widget.dart';
import 'package:serve_home/features/auth/presentation/widgets/or_continue_widget.dart';
import 'package:serve_home/features/auth/presentation/widgets/sign_in_button_widget.dart';
import 'package:serve_home/features/auth/presentation/widgets/sign_in_prompet_widget.dart';
import 'package:serve_home/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:serve_home/features/auth/presentation/widgets/welcome_sign_in_widget.dart';

// ignore: must_be_immutable
class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    email = TextEditingController(text: email.text);
    password = TextEditingController(text: password.text);
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Consumer<AuthViewModel>(
          builder:
              (context, provAuth, child) => Stack(
                clipBehavior: Clip.none,
                children: [
                  WelcomeSignInWidget(),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 35,
                          ),
                          height: 600,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                color: Colors.black12,
                                blurRadius: 4,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormFieldWidget(
                                contoller: email,
                                hintText: 'Enter your address',
                                icon: Icons.email,
                                label: 'Email',
                                isSignIn: true,
                              ),
                              SizedBox(height: 20),
                              TextFormFieldWidget(
                                isSignIn: true,
                                contoller: password,
                                hintText: 'Enter your password',
                                icon: Icons.password,
                                label: 'Password',
                              ),
                              SizedBox(height: ScreenSize.h(context)*0.05),

                              SignInButtonWidget(
                                password: password,
                                email: email,
                                keyForm: _key,
                              ),
                              SizedBox(height: 20),
                              OrContinueWidget(),
                              SizedBox(height: 15),
                              GoogleButtonWidget(),
                              Spacer(),
                              SignInPrompetWidget(),
                              Spacer(flex: 2),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  provAuth.isLoading == true
                      ? Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primary,
                        ),
                      )
                      : SizedBox.shrink(),
                ],
              ),
        ),
      ),
    );
  }
}
