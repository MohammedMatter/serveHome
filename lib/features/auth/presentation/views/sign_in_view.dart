import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/core/utils/input_validator.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  get provAuth => null;
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
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                          bottom: Radius.circular(45),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Welcome Back', style: AppStyle.button),
                            SizedBox(height: 5),
                            Text(
                              'Sign in to continue',
                              style: AppStyle.button.copyWith(
                                color: Color(0xffb7eaf7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                              Text('Email'),
                              SizedBox(height: 3),
                              TextFormField(
                                validator: (value) {
                                return  InputValidator.vaildateEmailSignIn(value!);
                                },
                                controller: email,
                                decoration: InputDecoration(
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Enter your address',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  fillColor: AppColor.filledTextField,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text('Password'),
                              SizedBox(height: 3),
                              TextFormField(
                                validator: (value) {
                                  return InputValidator.vaildatePassSignIn(
                                    value!,
                                  );
                                },
                                controller: password,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.grey,
                                  ),
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.lock_outline_rounded,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Enter your password',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  fillColor: AppColor.filledTextField,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  style: ButtonStyle(
                                    padding: WidgetStatePropertyAll(
                                      EdgeInsets.zero,
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Forogot Password ?',
                                    style: AppStyle.body19.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
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
                                                await provAuth.signIn(
                                                  password: password.text,
                                                  email: email.text,
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
                                                          content: Text(
                                                            provAuth
                                                                .errorMessage,
                                                            style:
                                                                AppStyle.button,
                                                          ),
                                                          backgroundColor:
                                                              Colors.red,
                                                        ),
                                                      )
                                                      .closed
                                                      .then((value) {
                                                        provAuth.reset();
                                                      });
                                                }
                                              }
                                            },
                                    child: Text('Sign In'),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 45, child: Divider()),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text('or continue with'),
                                  ),
                                  SizedBox(width: 45, child: Divider()),
                                ],
                              ),
                              SizedBox(height: 15),
                              OutlinedButton(
                                style: ButtonStyle(
                                  side: WidgetStatePropertyAll(
                                    BorderSide(color: Colors.grey, width: 1.2),
                                  ),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      child: Image.asset(
                                        'assets/images/icons/google_icon.png',
                                      ),
                                    ),
                                    SizedBox(width: 10),

                                    Text('Google', style: AppStyle.body15),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Row(
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
                              ),
                              Spacer(flex: 2),
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
