
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';
import 'package:serve_home/features/services/presentation/widgets/services_web_widget/service_form_field_widget.dart';

class EditServiceWidget extends StatelessWidget {
  String? id ; 
  ServiceModel serviceModel ; 
   EditServiceWidget({
    super.key,
    required this.serviceModel , 
    required this.id , 
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
      builder:(context, provService, child) =>  Expanded(
        child: OutlinedButton.icon(
          icon: Icon(
            Icons.edit,
            color:
                Colors
                    .black,
          ),
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                      8,
                    ),
              ),
            ),
          ),
          onPressed: () {
             provService.selectCategory(serviceModel.category) ; 
            descriptionServiceController.text = serviceModel.description ; 
            imageUrlServiceControllwer.text = serviceModel.categoryImageUrl ; 
            nameServiceController.text = serviceModel.name ; 
            priceServiceController.text = serviceModel.price ; 
            timeServiceController.text = serviceModel.time ; 
           
            showDialog(
              context:
                  context,
              builder:
                  (
                    context,
                  ) => ServiceFormFieldWidget(
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
                    method: () async {
                      final ServiceModel
                      serviceModel = ServiceModel(
                        category:
                            provService.selectedCategory!,
                        id:
                           id ,
                        name:
                            nameServiceController.text,
                        description:
                            descriptionServiceController.text,
                        price:
                            priceServiceController.text,
                        categoryImageUrl:
                            imageUrlServiceControllwer.text,
                        detailImageUrl:
                            imageUrlServiceControllwer.text,
                        creatdAt:
                            DateTime.now().toString(),
                        time:
                            timeServiceController.text,
                      );
                   
                      await provService.updateService(
                        serviceModel:
                            serviceModel,
                      );
                      nameServiceController.clear();
                      descriptionServiceController.clear();
                      priceServiceController.clear();
                      timeServiceController.clear();
                      imageUrlServiceControllwer.clear();
      
                      Navigator.of(
                        context,
                      ).pop();
                    },
                    title:
                        'Update Service',
                    labelButton:
                        'Update',
                  ),
            );
          },
          label: Text(
            'Edit',
            style: TextStyle(
              color:
                  Colors
                      .black,
            ),
          ),
        ),
      ),
    );
  }
}
