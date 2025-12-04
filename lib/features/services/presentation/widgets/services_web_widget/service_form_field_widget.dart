import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';
import 'package:serve_home/features/services/presentation/widgets/services_web_widget/add_service_text_field.dart';

class ServiceFormFieldWidget extends StatelessWidget {
  ServiceFormFieldWidget({
    super.key,
    required this.title,
    required this.labelButton,
    required this.method,
    required this.nameServiceController,
    required this.descriptionServiceController,
    required this.priceServiceController,
    required this.categoryServiceController,
    required this.imageUrlServiceControllwer,
    required this.timeServiceController,
  });
  String title;
  String labelButton;
  Function() method;
  TextEditingController nameServiceController;
  TextEditingController descriptionServiceController;
  TextEditingController priceServiceController;
  TextEditingController timeServiceController;
  TextEditingController categoryServiceController;
  TextEditingController imageUrlServiceControllwer;

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceViewModel>(
      builder:
          (context, provService, child) => AlertDialog(
            actions: [
              OutlinedButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.black),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed:
                    !provService.isLoading
                        ? () {
                          GoRouter.of(context).pop();
                        }
                        : null,

                child: Text('Cancel'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(AppColor.primary),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                onPressed: method,
                child: Text(labelButton),
              ),
            ],
            backgroundColor: Colors.white,
            title: Text(title, style: AppStyle.body17),
            content: SizedBox(
              height: ScreenSize.h(context) * 0.5,
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyle.body15),
                  AddServiceTextField(
                    controller: nameServiceController,
                    textInputFormatter: FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z\s]'),
                    ),
                    hint: 'eg : Fix Electrical Problem',
                    maxLines: 1,
                  ),
                  Text('Description', style: AppStyle.body15),
                  AddServiceTextField(
                    controller: descriptionServiceController,
                    textInputFormatter: FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z\s]'),
                    ),
                    hint: 'Describe the service',
                    maxLines: 4,
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Base Price', style: AppStyle.body15),

                            AddServiceTextField(
                              controller: priceServiceController,
                              textInputFormatter:
                                  FilteringTextInputFormatter.digitsOnly,
                              hint: 'eg : 80\$',
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Time', style: AppStyle.body15),

                            AddServiceTextField(
                              controller: timeServiceController,
                              textInputFormatter:
                                  FilteringTextInputFormatter.digitsOnly,
                              hint: '2-3 hours',
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text('Category', style: AppStyle.body15),

                  DropdownButton(
                    isExpanded: true,
                    hint: Text('Select Category'),
                    value: provService.selectedCategory,
                    items: [
                      DropdownMenuItem(
                        value: provService.categories[0].name,
                        child: Text(provService.categories[0].name),
                      ),
                      DropdownMenuItem(
                        value: provService.categories[1].name,
                        child: Text(provService.categories[1].name),
                      ),
                      DropdownMenuItem(
                        value: provService.categories[2].name,
                        child: Text(provService.categories[2].name),
                      ),
                      DropdownMenuItem(
                        value: provService.categories[3].name,
                        child: Text(provService.categories[3].name),
                      ),
                      DropdownMenuItem(
                        value: provService.categories[4].name,
                        child: Text(provService.categories[4].name),
                      ),
                    ],
                    onChanged: (value) {
                      provService.selectCategory(value!);
                    },
                  ),

                  Text('Image Url ', style: AppStyle.body15),
                  AddServiceTextField(
                    controller: imageUrlServiceControllwer,

                    hint: 'http://...',
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
