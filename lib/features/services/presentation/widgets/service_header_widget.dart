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
                      height: 250,
                      width: double.infinity,
                     service.detailImageUrl,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.primary.withOpacity(0.8),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                        ),
                      ),
                      padding: EdgeInsets.only(bottom: 5, top: 5),
                      alignment: Alignment.center,
                      width: 200,

                      child: Text(service.name, style: AppStyle.button),
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
                        child: Icon(Icons.favorite_border_outlined),
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 15,
                      color: Colors.black12,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),

                height: 80,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text('Starting from'), Text('Duration')],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('From \$${service.price}', style: AppStyle.body19),
                        Row(
                          children: [
                            Icon(Icons.access_time_sharp, size: 20),
                            SizedBox(width: 5),
                            Text('2 - 3 hours', style: AppStyle.body15),
                          ],
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
