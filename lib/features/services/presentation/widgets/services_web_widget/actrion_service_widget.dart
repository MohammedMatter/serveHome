

import 'package:flutter/material.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/presentation/widgets/services_web_widget/delete_service_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/services_web_widget/edit_service_widget.dart';

class ActionServiceWidget extends StatelessWidget {
  String? id ; 
  ServiceModel serviceModel ; 
   ActionServiceWidget({
    super.key,
    required this.id , 
    required this.serviceModel ,
    required this.categoryServiceController,
    required this.descriptionServiceController,
    required this.imageUrlServiceControllwer,
    required this.nameServiceController,
    required this.priceServiceController,
    required this.timeServiceController,
  });

  final TextEditingController categoryServiceController;
  final TextEditingController descriptionServiceController;
  final TextEditingController imageUrlServiceControllwer;
  final TextEditingController nameServiceController;
  final TextEditingController priceServiceController;
  final TextEditingController timeServiceController;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        EditServiceWidget(
          serviceModel: serviceModel,
          categoryServiceController:
              categoryServiceController,
          descriptionServiceController:
              descriptionServiceController,
          imageUrlServiceControllwer:
              imageUrlServiceControllwer,
          nameServiceController:
              nameServiceController,
          priceServiceController:
              priceServiceController,
          timeServiceController:
              timeServiceController,
         id: id,
        ),
        SizedBox(
          width:
              ScreenSize.w(
                context,
              ) *
              0.01,
        ),
        DeleteServiceWidget(serviceModel:  serviceModel,),
      ],
    );
  }
}
