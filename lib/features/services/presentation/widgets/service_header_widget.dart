import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class ServiceHeaderWidget extends StatelessWidget {
  ServiceModel service;
  ServiceHeaderWidget({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceViewModel>(
      builder:
          (context, provService, child) => Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      fit: BoxFit.fill,
                      height: 200,
                      width: double.infinity,
                      service.detailImageUrl,
                      errorBuilder:
                          (context, error, stackTrace) => Image.asset(
                            fit: BoxFit.fill,
                            'assets/images/placeholderImage/placeholder.png',
                          ),
                    ),
                  ),

                  Positioned(
                    left: 0,
                    top: 20,
                    child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        style: ButtonStyle(
                          iconSize: WidgetStatePropertyAll(25),
                          shape: WidgetStatePropertyAll(CircleBorder()),
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.white.withOpacity(0.88),
                          ),
                        ),
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 0,
                    child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          iconSize: WidgetStatePropertyAll(25),
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.white.withOpacity(0.88),
                          ),
                          shape: WidgetStatePropertyAll(CircleBorder()),
                        ),
                        onPressed: () {},
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 15,
                      color: Colors.black12,
                    ),
                  ],

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),

                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${service.name} Service',
                        style: AppStyle.body17,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${service.time} hours', style: AppStyle.body17),
                        SizedBox(width: 5),
                        Icon(
                          Icons.access_time_sharp,
                          size: 17,
                          color: AppColor.primary,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '${service.price}\$',
                          style: AppStyle.body19.copyWith(color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
