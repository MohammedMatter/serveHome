import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class ServiceHeaderWidget extends StatelessWidget {
  final ServiceModel service;
  const ServiceHeaderWidget({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = ScreenSize.w(context);
    final double screenHeight = ScreenSize.h(context);

    final double imageHeight = (screenHeight * 0.28).clamp(180, 300);
    final double buttonSize = (screenHeight * 0.06).clamp(40, 55);

    return Consumer<ServiceViewModel>(
      builder: (context, provService, child) => Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  service.detailImageUrl,
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/placeholderImage/placeholder.png',
                    fit: BoxFit.cover,
                    height: imageHeight,
                    width: double.infinity,
                  ),
                ),
              ),

              Positioned(
                left: screenWidth * 0.03,
                top: screenHeight * 0.02,
                child: SizedBox(
                  height: buttonSize,
                  width: buttonSize,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.white.withOpacity(0.88),
                      ),
                      shape: WidgetStatePropertyAll(CircleBorder()),
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    ),
                    child: Icon(Icons.arrow_back, color: Colors.black, size: buttonSize * 0.5),
                  ),
                ),
              ),

              Positioned(
                right: screenWidth * 0.03,
                top: screenHeight * 0.02,
                child: SizedBox(
                  height: buttonSize,
                  width: buttonSize,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.white.withOpacity(0.88),
                      ),
                      shape: WidgetStatePropertyAll(CircleBorder()),
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    ),
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: AppColor.primary,
                      size: buttonSize * 0.5,
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
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.015,
              horizontal: screenWidth * 0.04,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${service.name} Service',
                  style: AppStyle.body17(context).copyWith(
                    fontSize: (screenWidth * 0.05).clamp(16, 22),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${service.time} hours',
                      style: AppStyle.body17(context).copyWith(
                        fontSize: (screenWidth * 0.04).clamp(14, 20),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Icon(
                      Icons.access_time_sharp,
                      size: (screenWidth * 0.04).clamp(16, 20),
                      color: AppColor.primary,
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Text(
                      '${service.price}\$',
                      style: AppStyle.body19(context).copyWith(
                        fontSize: (screenWidth * 0.045).clamp(16, 22),
                        color: Colors.green,
                      ),
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
