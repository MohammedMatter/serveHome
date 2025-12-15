import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/home/presentation/view_models/home_view_model.dart';
import 'package:serve_home/features/notification/presentation/view_models/notification_view_model.dart';

class BookServiceWidget extends StatelessWidget {
  const BookServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: ScreenSize.h(context) * 0.10,
          width: double.infinity,
          color: AppColor.primary,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Align(
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
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
                    style: AppStyle.appBarTitle.copyWith(fontSize: 20),
                  ),
                  SizedBox(height: 5),
                  Consumer<HomeViewModel>(
                    builder:
                        (context, provHome, child) =>
                            ElevatedButton.icon(
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
                                style: AppStyle.button,
                              ),
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),

                                backgroundColor: WidgetStatePropertyAll(
                                  AppColor.secondry,
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
