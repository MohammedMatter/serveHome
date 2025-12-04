import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';
import 'package:serve_home/features/services/presentation/widgets/services_web_widget/service_form_field_widget.dart';

class AddServiceWidget extends StatelessWidget {

  const AddServiceWidget({
    super.key,
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
    return Consumer<ServiceViewModel>(
      builder:
          (context, provService, child) => ElevatedButton.icon(
            icon: Icon(Icons.add),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColor.primary),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),

            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => StatefulBuilder(
                      builder:
                          (context, setState) => Stack(
                            children: [
                              ServiceFormFieldWidget(
                                categoryServiceController:
                                    categoryServiceController,
                                descriptionServiceController:
                                    descriptionServiceController,
                                imageUrlServiceControllwer:
                                    imageUrlServiceControllwer,
                                nameServiceController: nameServiceController,
                                priceServiceController: priceServiceController,
                                timeServiceController: timeServiceController,
                                method: () async {
                                  setState(() => provService.isLoading = true);
                                  await Future.delayed(Duration(seconds: 1));
                                  final ServiceModel serviceModel =
                                      ServiceModel(
                                        category: provService.selectedCategory!,
                                        name: nameServiceController.text,
                                        description:
                                            descriptionServiceController.text,
                                        price: priceServiceController.text,
                                        categoryImageUrl:
                                            imageUrlServiceControllwer.text,
                                        detailImageUrl:
                                            imageUrlServiceControllwer.text,
                                        creatdAt: DateTime.now().toString(),
                                        time: timeServiceController.text,
                                      );

                                  await provService.addService(
                                    serviceModel: serviceModel,
                                  );

                                  setState(() => provService.isLoading = false);
                                  nameServiceController.clear();
                                  descriptionServiceController.clear();
                                  priceServiceController.clear();
                                  timeServiceController.clear();
                                  imageUrlServiceControllwer.clear();

                                  provService.isLoading == false
                                      ? Navigator.of(context).pop()
                                      : null;
                                },
                                labelButton: 'Add Service ',
                                title: 'Add new Service',
                              ),
                              provService.isLoading
                                  ? Center(child: CircularProgressIndicator())
                                  : SizedBox.shrink(),
                            ],
                          ),
                    ),
              );
            },
            label: Text('Add New Service'),
          ),
    );
  }
}
