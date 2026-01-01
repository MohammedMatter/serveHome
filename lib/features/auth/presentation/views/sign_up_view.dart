import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/features/auth/data/models/user_model.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:serve_home/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:serve_home/features/auth/presentation/widgets/welcome_sign_up_widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // responsive measurements
    double topPadding = ScreenSize.h(context) * 0.18;
    double containerMarginH = ScreenSize.w(context) * 0.06;
    double containerPadding = ScreenSize.h(context) * 0.04;
    double borderRadius = ScreenSize.h(context) * 0.03;
    double spacing = ScreenSize.h(context) * 0.02;
    double btnHeight = ScreenSize.h(context) * 0.07;
    double btnRadius = ScreenSize.h(context) * 0.018;
    double btnFontSize = ScreenSize.h(context) * 0.02;

    return Scaffold(
      body: Form(
        key: _key,
        child: Consumer<AuthViewModel>(
          builder:
              (context, provAuth, child) => Stack(
                clipBehavior: Clip.none,
                children: [
                  WelcomeSignUpWidget(),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: topPadding),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: containerMarginH,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: containerPadding,
                          vertical: containerPadding,
                        ),

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
                          borderRadius: BorderRadius.circular(borderRadius),
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
                            SizedBox(height: spacing),
                            TextFormFieldWidget(
                              contoller: email,
                              hintText: 'Enter your address',
                              icon: Icons.email_outlined,
                              label: 'Email',
                              isSignIn: false,
                            ),
                            SizedBox(height: spacing),
                            TextFormFieldWidget(
                              contoller: phone,
                              hintText: 'Enter your phone number',
                              icon: Icons.phone,
                              label: 'Phone Number',
                              isSignIn: false,
                            ),
                            SizedBox(height: spacing),
                            TextFormFieldWidget(
                              contoller: password,
                              hintText: 'Enter your password',
                              icon: Icons.password,
                              label: 'Password',
                              isSignIn: false,
                            ),
                            SizedBox(height: spacing * 2),
                            Center(
                              child: SizedBox(
                                height: btnHeight,
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
                                          btnRadius,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed:
                                      provAuth.isLoading
                                          ? null
                                          : () async {
                                            if (_key.currentState!.validate()) {
                                              UserModel userModel = UserModel(
                                                name: name.text,
                                                phone: phone.text,
                                                email: email.text,
                                                role: 'user',
                                              );
                                              await provAuth.signUp(
                                                password: password.text,
                                                userModel: userModel,
                                                onSuccess: () {
                                                  GoRouter.of(
                                                    context,
                                                  ).pushNamed(
                                                    AppRouter.homeView,
                                                  );
                                                },
                                              );
                                            if(provAuth.errorMessage.isNotEmpty) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          provAuth.errorMessage,
                                                          style:
                                                              AppStyle.button(
                                                                context,
                                                              ).copyWith(
                                                                fontSize:
                                                                    btnFontSize,
                                                              ),
                                                        ),
                                                        backgroundColor:
                                                            Colors.red,
                                                      ),
                                                    )
                                                    .closed
                                                    .then((value) {
                                                      provAuth.errorMessage =
                                                          '';
                                                      provAuth.isLoading =
                                                          false;
                                                    });
                                              }
                                            }
                                          },
                                  child: Text(
                                    'Create Account',
                                    style: AppStyle.button(
                                      context,
                                    ).copyWith(fontSize: btnFontSize),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already have an account ?'),
                                TextButton(
                                  onPressed:
                                      provAuth.isLoading
                                          ? null
                                          : () {
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (provAuth.isLoading)
                    Center(
                      child: CircularProgressIndicator(color: AppColor.primary),
                    ),
                ],
              ),
        ),
      ),
    );
  }
}
