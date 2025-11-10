
import 'package:flutter/material.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';

class ServiceDescriptionWidget extends StatelessWidget {
  ServiceModel service;
   ServiceDescriptionWidget({
    super.key,
    required  this.service
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'About this Service',
            style: AppStyle.body19
          ),
        ),
        SizedBox(height: 15),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 280,
            child: Text(
              service.description,
              style: AppStyle.subTitle.copyWith(
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
