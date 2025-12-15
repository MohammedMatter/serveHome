
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/book_service.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/bottom_navigation_bar_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/discount_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/featured_providers_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/search_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/service_categories_widget.dart';

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.only(right: 15),
        backgroundColor: AppColor.primary,
        title: Text('ServeHome', style: AppStyle.appBarTitle),
        actions: [
          Icon(Icons.notifications_none, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BookServiceWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
             
                    SizedBox(height: 15),
                    Text('Services Categories ', style: AppStyle.body19),
                    SizedBox(height: 10),
                    ServiceCtegoriesWidget(),
                    SizedBox(height: 15),
                    Text('Featured Providers', style: AppStyle.body19),
                    SizedBox(height: 10),
                    FeaturesProvidersWidget(),
                    SizedBox(height: 10),
                    DisountWidget(),
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
