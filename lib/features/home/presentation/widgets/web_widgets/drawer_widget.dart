// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/constants/drawer_actions.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/features/categories/presentation/views/web/categories_web_view.dart';
import 'package:serve_home/features/home/presentation/view_models/home_view_model.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder:
          (context, provHome, child) => SizedBox(
            height: ScreenSize.h(context),
            child: Drawer(
              shape: RoundedRectangleBorder(),
              backgroundColor: Color(0xff1e293b),
              width: 80,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  IconButton(
                    hoverColor: AppColor.primary.withOpacity(0.3),
                    icon: Icon(Icons.arrow_forward_ios_outlined, size: 15),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Divider(color: Colors.white, thickness: 0.4),
                  SizedBox(height: 8),
                  Column(
                    children:
                        drawerActions
                            .map(
                              (icon) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  hoverColor: AppColor.primary.withOpacity(0.3),
                                  onPressed: () {
                                    provHome.changeDrowerIndex(
                                      drawerActions.indexOf(icon),
                                    );
                                    switch (provHome.drowerIndex) {
                                      case 0:
                                        GoRouter.of(
                                          context,
                                        ).pushNamed(AppRouter.homeWebView);
                                      case 1:
                                        GoRouter.of(
                                          context,
                                        ).pushNamed(AppRouter.bookingsWebView);
                                      case 2:
                                        GoRouter.of(
                                          context,
                                        ).pushNamed(AppRouter.servicesWebView);
                                      case 3:
                                        GoRouter.of(
                                          context,
                                        ).pushNamed(AppRouter.categoriesWebView);
                                      case 4:
                                        GoRouter.of(
                                          context,
                                        ).pushNamed(AppRouter.bookingsWebView);
                                      case 5:
                                        GoRouter.of(
                                          context,
                                        ).pushNamed(AppRouter.bookingsWebView);
                                      case 6:
                                        GoRouter.of(
                                          context,
                                        ).pushNamed(AppRouter.bookingsWebView);
                                    }
                                  },
                                  icon: icon,
                                  style: ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    backgroundColor: WidgetStatePropertyAll(
                                      provHome.drowerIndex ==
                                              drawerActions.indexOf(icon)
                                          ? AppColor.primary
                                          : null,
                                    ),
                                    foregroundColor: WidgetStatePropertyAll(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
