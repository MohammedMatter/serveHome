import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/auth/data/models/user_model.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:serve_home/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:serve_home/features/auth/presentation/widgets/welcome_sign_up_widget.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: SafeArea(
          child: Consumer<AuthViewModel>(
            builder:
                (context, provAuth, child) => Stack(
                  clipBehavior: Clip.none,
                  children: [
                    WelcomeSignUpWidget(),
                    Padding(
                      padding: const EdgeInsets.only(top: 130),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 35,
                          ),
                          height: 620,
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
                                contoller: name,
                                hintText: 'Enter your name',
                                icon: Icons.person_2_outlined,
                                label: 'Name',
                                isSignIn: false,
                              ),
                              SizedBox(height: 10),
                              TextFormFieldWidget(
                                contoller: email,
                                hintText: 'Enter your address',
                                icon: Icons.email_outlined,
                                label: 'Email',
                                isSignIn: false,
                              ),
                              SizedBox(height: 10),
                              TextFormFieldWidget(
                                contoller: phone,
                                hintText: 'Enter your phone number',
                                icon: Icons.phone,
                                label: 'Phone Number',
                                isSignIn: false,
                              ),
                              SizedBox(height: 10),
                              TextFormFieldWidget(
                                contoller: password,
                                hintText: 'Enter your password',
                                icon: Icons.password,
                                label: 'Password',
                                isSignIn: false,
                              ),

                              SizedBox(height: 20),
                              Center(
                                child: SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      foregroundColor: WidgetStatePropertyAll(
                                        Colors.white,
                                      ),
                                      backgroundColor: WidgetStatePropertyAll(
                                        AppColor.primary,
                                      ),
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onPressed:
                                        provAuth.isLoading ||
                                                provAuth.errorMessage.isNotEmpty
                                            ? null
                                            : () async {
                                              if (_key.currentState!
                                                  .validate()) {
                                                UserModel userModel = UserModel(
                                                  name: name.text,
                                                  phone: phone.text,
                                                  email: email.text,
                                                  role: 'user',
                                                );
                                                await provAuth.signUp(
                                                  password: password.text,
                                                  userModel: userModel,
                                                );
                                                if (provAuth
                                                    .errorMessage
                                                    .isEmpty) {
                                                  GoRouter.of(
                                                    context,
                                                  ).pushNamed(
                                                    AppRouter.homeView,
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                        SnackBar(
                                                          content: SizedBox(
                                                            child: Text(
                                                              provAuth
                                                                  .errorMessage,
                                                              style:
                                                                  AppStyle
                                                                      .button,
                                                            ),
                                                          ),
                                                          backgroundColor:
                                                              Colors.red,
                                                        ),
                                                      )
                                                      .closed
                                                      .then((value) {
                                                        ;
                                                        provAuth.errorMessage =
                                                            '';
                                                        provAuth.isLoading =
                                                            false;
                                                      });
                                                }
                                              }
                                            },
                                    child: Text('Create Account'),
                                  ),
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Already have an account ?'),
                                  TextButton(
                                    onPressed: () {
                                      GoRouter.of(
                                        context,
                                      ).pushNamed(AppRouter.signInView);
                                    },
                                    child: Text(
                                      'Sign in',
                                      style: TextStyle(color: AppColor.primary),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
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
      ),
    );
  }
}
