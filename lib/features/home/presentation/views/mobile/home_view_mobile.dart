import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/book_service.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/bottom_navigation_bar_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/discount_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/featured_providers_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/service_categories_widget.dart';

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.only(right: 15),
        backgroundColor: AppColor.primary,
        title: Text('ServeHome', style: AppStyle.appBarTitle(context)),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BookServiceWidget(), //Done Responsive
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ScreenSize.h(context) * 0.01),
                    Text('Services Categories ', style: AppStyle.body19(context)),
                    SizedBox(height: ScreenSize.h(context) * 0.01),
                    ServiceCtegoriesWidget(), //Done Responsive
                    SizedBox(height: ScreenSize.h(context) * 0.01),
                    SizedBox(height: 15),
                    Text('Featured Providers', style: AppStyle.body19(context)),
                    SizedBox(height: ScreenSize.h(context) * 0.01),
                    FeaturesProvidersWidget(), //Done Responsive
                    SizedBox(height: ScreenSize.h(context) * 0.02),
                    DiscountWidget(), //Done Responsive
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
