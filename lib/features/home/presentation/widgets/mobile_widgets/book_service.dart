import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/home/presentation/view_models/home_view_model.dart';

class BookServiceWidget extends StatelessWidget {
  const BookServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double radius = (ScreenSize.w(context) * 0.02).clamp(12, 20);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: ScreenSize.h(context) * 0.10,
          width: double.infinity,
          color: AppColor.primary,
        ),
        Padding(
          padding:  EdgeInsets.only(top: ScreenSize.h(context)*0.04),
          child: Align(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: ScreenSize.w(context)*0.1),
              alignment: Alignment.center,
              height: (ScreenSize.h(context)*0.11).clamp(100, double.infinity),
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(radius),
                gradient: LinearGradient(
                  colors: [
                    AppColor.primary,
                    AppColor.secondry.withOpacity(0.7),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ready to book your service?',
                    style: AppStyle.appBarTitle(context).copyWith(fontSize: (ScreenSize.w(context)*0.04).clamp(20, 25)),
                  ),
                  SizedBox(height: ScreenSize.h(context)*0.01),
                  Consumer<HomeViewModel>(
                    builder:
                        (context, provHome, child) =>
                            SizedBox(
                              height:( ScreenSize.h(context)*0.05).clamp(40, double.infinity) ,
                              width: ScreenSize.w(context)*0.5,
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  provHome.changeBottomNavigationBarIndex(1) ; 
                                  GoRouter.of(
                                    context,
                                  ).pushNamed(AppRouter.allServicesView);
                                },
                                iconAlignment: IconAlignment.end,
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'Book a Service',
                                  style: AppStyle.button(context),
                                ),
                                style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(radius),
                                    ),
                                  ),
                              
                                  backgroundColor: WidgetStatePropertyAll(
                                    AppColor.secondry,
                                  ),
                                ),
                              ),
                            ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
