import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/home/presentation/view_models/home_view_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class ServiceCtegoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeViewModel, ServiceViewModel>(
      builder:
          (context, provHome, provService, child) => SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) => Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xfff2f1f1)
                      ),
                      margin: EdgeInsets.only(right: 15),

                      width: 90,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
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
                            SizedBox(height: 5),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                child: Image.asset(
                                  provService.categories[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              provService.categories[index].name,
                              textAlign: TextAlign.center,
                              style: AppStyle.body15.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColor.primary,
                              ),
                              maxLines: 1,
                            ),
                            SizedBox(height: 15),
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
