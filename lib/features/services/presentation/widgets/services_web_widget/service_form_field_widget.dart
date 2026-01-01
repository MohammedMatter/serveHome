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
  final String title;
  final String labelButton;
  final Function() method;
  final TextEditingController nameServiceController;
  final TextEditingController descriptionServiceController;
  final TextEditingController priceServiceController;
  final TextEditingController timeServiceController;
  final TextEditingController categoryServiceController;
  final TextEditingController imageUrlServiceControllwer;

  const ServiceFormFieldWidget({
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

  @override
  Widget build(BuildContext context) {
    final double dialogWidth = ScreenSize.w(context) > 500 ? 500 : ScreenSize.w(context) * 0.9;
    final double fieldSpacing = ScreenSize.h(context) * 0.015;

    return Consumer<ServiceViewModel>(
      builder: (context, provService, child) => AlertDialog(
        actionsPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        actions: [
          OutlinedButton(
            style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(Colors.black),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            onPressed: !provService.isLoading ? () => GoRouter.of(context).pop() : null,
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              backgroundColor: WidgetStatePropertyAll(AppColor.primary),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            onPressed: method,
            child: Text(labelButton),
          ),
        ],
        backgroundColor: Colors.white,
        title: Text(title, style: AppStyle.body17(context)),
        content: SizedBox(
          width: dialogWidth,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: fieldSpacing),
                Text('Service Name', style: AppStyle.body15(context)),
                AddServiceTextField(
                  controller: nameServiceController,
                  textInputFormatter: FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                  hint: 'eg: Fix Electrical Problem',
                  maxLines: 1,
                ),
                SizedBox(height: fieldSpacing),
                Text('Description', style: AppStyle.body15(context)),
                AddServiceTextField(
                  controller: descriptionServiceController,
                  textInputFormatter: FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                  hint: 'Describe the service',
                  maxLines: 4,
                ),
                SizedBox(height: fieldSpacing),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Base Price', style: AppStyle.body15(context)),
                          AddServiceTextField(
                            controller: priceServiceController,
                            textInputFormatter: FilteringTextInputFormatter.digitsOnly,
                            hint: 'eg: 80\$',
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Time', style: AppStyle.body15(context)),
                          AddServiceTextField(
                            controller: timeServiceController,
                            textInputFormatter: FilteringTextInputFormatter.digitsOnly,
                            hint: '2-3 hours',
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: fieldSpacing),
                Text('Category', style: AppStyle.body15(context)),
                DropdownButton(
                  isExpanded: true,
                  hint: const Text('Select Category'),
                  value: provService.selectedCategory,
                  items: provService.categories
                      .map(
                        (cat) => DropdownMenuItem(
                          value: cat.name,
                          child: Text(cat.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => provService.selectCategory(value!),
                ),
                SizedBox(height: fieldSpacing),
                Text('Image URL', style: AppStyle.body15(context)),
                AddServiceTextField(
                  controller: imageUrlServiceControllwer,
                  hint: 'http://...',
                  maxLines: 1,
                ),
                SizedBox(height: fieldSpacing),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
