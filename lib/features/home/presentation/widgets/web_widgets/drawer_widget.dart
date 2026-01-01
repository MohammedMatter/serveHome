import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/constants/drawer_actions.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/features/home/presentation/view_models/home_view_model.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double drawerWidth = (ScreenSize.w(context) * 0.08).clamp(60, 120);
    double topPadding = (ScreenSize.h(context) * 0.03).clamp(20, 40);
    double iconButtonSize = (ScreenSize.w(context) * 0.03).clamp(15, 25);
    double iconPadding = (ScreenSize.w(context) * 0.02).clamp(6, 12);

    return Consumer<HomeViewModel>(
      builder:
          (context, provHome, child) => Drawer(
            shape: RoundedRectangleBorder(),
            backgroundColor: const Color(0xff1e293b),
            width: drawerWidth,
            child: Column(
              children: [
                SizedBox(height: topPadding),
                IconButton(
                  // ignore: deprecated_member_use
                  hoverColor: AppColor.primary.withOpacity(0.3),
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: iconButtonSize,
                  ),
                  onPressed: () {},
                  color: Colors.white,
                ),
                SizedBox(height: topPadding * 0.7),
                Divider(color: Colors.white, thickness: 0.4),
                SizedBox(height: topPadding * 0.3),
                Column(
                  children:
                      drawerActions.map((icon) {
                        int index = drawerActions.indexOf(icon);
                        return Padding(
                          padding: EdgeInsets.all(iconPadding),
                          child: IconButton(
                            hoverColor: AppColor.primary.withOpacity(0.3),
                            onPressed: () {
                              provHome.changeDrowerIndex(index);
                              switch (provHome.drowerIndex) {
                                case 0:
                                  GoRouter.of(
                                    context,
                                  ).pushNamed(AppRouter.homeWebView);
                                  break;
                                case 1:
                                  GoRouter.of(
                                    context,
                                  ).pushNamed(AppRouter.bookingsWebView);
                                  break;
                                case 2:
                                  GoRouter.of(
                                    context,
                                  ).pushNamed(AppRouter.servicesWebView);
                                  break;
                              }
                            },
                            icon: icon,
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    (ScreenSize.w(context) * 0.02).clamp(
                                      6,
                                      12,
                                    ),
                                  ),
                                ),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                provHome.drowerIndex == index
                                    ? AppColor.primary
                                    : null,
                              ),
                              foregroundColor: const WidgetStatePropertyAll(
                                Colors.white,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
    );
  }
}
