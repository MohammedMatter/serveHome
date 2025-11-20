import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/core/utils/input_validator.dart';
import 'package:serve_home/features/auth/data/models/user_model.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
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
                            Text('Create Account', style: AppStyle.button),
                            SizedBox(height: 5),
                            Text(
                              'Join SERVE HOME today',
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
                              Text('Full Name'),
                              TextFormField(
                                validator: (value) {
                                  return InputValidator.vaildateNameSignUp(
                                    value!,
                                  );
                                },
                                controller: name,
                                decoration: InputDecoration(
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Enter your Full name',
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
                              Text('Email'),
                              SizedBox(height: 3),
                              TextFormField(
                                validator: (value) {
                                  return InputValidator.vaildateEmailSignUp(
                                    value!,
                                  );
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
                              SizedBox(height: 10),
                              Text('Phone Number'),
                              SizedBox(height: 3),
                              TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  return InputValidator.vaildatePhoneSignUp(
                                    value!,
                                  );
                                },
                                controller: phone,
                                decoration: InputDecoration(
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.call_outlined,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Enter your phone number',
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
                              Text('Password'),
                              SizedBox(height: 3),
                              TextFormField(
                                validator: (value) {
                                  return InputValidator.vaildatePassSignUp(
                                    value!,
                                  );
                                },
                                controller: password,
                                decoration: InputDecoration(
                                  errorMaxLines: 3,
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
                                                  role: 'user'
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
                                                        provAuth.reset();
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
