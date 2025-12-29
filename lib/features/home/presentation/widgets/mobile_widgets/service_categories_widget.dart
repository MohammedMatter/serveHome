import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/home/presentation/view_models/home_view_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class ServiceCtegoriesWidget extends StatelessWidget {
  const ServiceCtegoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeViewModel, ServiceViewModel>(
      builder:
          (context, provHome, provService, child) => SizedBox(
            height: (ScreenSize.h(context) * 0.15).clamp(70, double.infinity),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) => Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          (ScreenSize.w(context) * 0.03).clamp(12, 25),
                        ),
                        color: Color(0xfff2f1f1),
                      ),
                      margin: EdgeInsets.only(
                        right: ScreenSize.w(context) * 0.02,
                      ),
                      width: (ScreenSize.w(context) * 0.3).clamp(100, 300),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(
                          (ScreenSize.w(context) * 0.03).clamp(12, 25),
                        ),
                        onTap: () {
                          GoRouter.of(
                            context,
                          ).pushNamed(AppRouter.categoryServicesView);
                          provService.selectCategory(
                            provService.categories[index].name,
                          );
                          provService.filterServices();
                        },
                        child: Column(
                          children: [
                            SizedBox(height: ScreenSize.h(context) * 0.01),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(  (ScreenSize.w(context) * 0.03).clamp(12, 25)),
                                ),
                                child: Image.asset(
                                  provService.categories[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenSize.h(context) * 0.01),
                            Text(
                              provService.categories[index].name,
                              textAlign: TextAlign.center,
                              style: AppStyle.body15.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColor.primary,
                                fontSize: (ScreenSize.w(context) * 0.04).clamp(
                                  13,
                                  20,
                                ),
                              ),
                              maxLines: 1,
                            ),
                            SizedBox(height: ScreenSize.h(context) * 0.01),
                          ],
                        ),
                      ),
                    ),
                  ),
              itemCount: provService.categories.length,
            ),
          ),
    );
  }
}
