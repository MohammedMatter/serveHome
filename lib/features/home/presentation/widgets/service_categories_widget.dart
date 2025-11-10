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
          (context, provHome, provService ,  child) => SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) => Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColor.primary, width: 0.8),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(right: 15),
                      height: 120,
                      width: 90,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                            AppRouter.serviceDetailsView,
                            extra: provService.services[index],
                          );
                          provService.selectService(
                            provService.services[index],
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 50,
                              child: Image.asset(
                                provService.services[index].categoryImageUrl,
                              ),
                            ),
                            Text(
                              provService.services[index].name,
                              textAlign: TextAlign.center,
                              style: AppStyle.body19.copyWith(
                                fontSize: 12,
                                color: AppColor.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              itemCount: provService.services.length,
            ),
          ),
    );
  }
}
