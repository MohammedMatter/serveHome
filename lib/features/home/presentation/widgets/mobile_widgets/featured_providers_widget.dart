import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';

class FeaturesProvidersWidget extends StatelessWidget {
  FeaturesProvidersWidget({super.key});
  final List<String> workers = [
    'assets/images/workers/elctrical_worker.png',
    'assets/images/workers/cleaning_worker.png',
    'assets/images/workers/plumbing_worker.png',
    'assets/images/workers/decorating_worker.png',
  ];
  @override
  Widget build(BuildContext context) {
    final double radius = (ScreenSize.w(context) * 0.02).clamp(12, 20);
    return SizedBox(
      height: (ScreenSize.h(context) * 0.19).clamp(180, double.infinity),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: Color(0xfff2f1f1),
                ),
                margin: EdgeInsets.only(right: radius),
                width: (ScreenSize.w(context) * 0.3).clamp(
                  170,
                  double.infinity,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 140, 170, 184),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(radius),
                          topRight: Radius.circular(radius),
                        ),
                      ),

                      child: SizedBox(
                        height: (ScreenSize.h(context) * 0.1).clamp(100, 150),
                        width: double.infinity,
                        child: Image.asset(workers[index] ,fit: BoxFit.contain),
                      ),
                    ),
                    Container(
                            padding: EdgeInsets.all(radius),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: AppStyle.body19(context).copyWith(
                              fontSize: (ScreenSize.w(context) * 0.04).clamp(
                                15,
                                25,
                              ),
                            ),
                          ),
                          Row(
                      
                            children: List.generate(
                              5,
                              (index) => Icon(
                                size: (ScreenSize.h(context) * 0.02).clamp(20, double.infinity),
                                Icons.star,
                                color: AppColor.secondry,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        itemCount: workers.length,
      ),
    );
  }
}
