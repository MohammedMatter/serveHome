import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/responsive_config.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/home/presentation/widgets/web_widgets/drawer_widget.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';
import 'package:serve_home/features/services/presentation/widgets/services_web_widget/service_form_field_widget.dart';

class ServicesWebView extends StatelessWidget {
  TextEditingController nameServiceController = TextEditingController();
  TextEditingController descriptionServiceController = TextEditingController();
  TextEditingController priceServiceController = TextEditingController();
  TextEditingController timeServiceController = TextEditingController();
  TextEditingController categoryServiceController = TextEditingController();
  TextEditingController imageUrlServiceControllwer = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ServiceViewModel>(
        builder:
            (context, provService, child) => Center(
              child: Row(
                children: [
                  DrawerWidget(),

                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxixCount = 0;
                        final confegResposive =
                            ResponsiveConfig.fromConstraints(
                              constraints,
                              context,
                              crossAxixCount,
                            );
                        return Padding(
                          padding: EdgeInsets.only(
                            left: ScreenSize.w(context) * 0.03,
                            top: ScreenSize.w(context) * 0.03,
                            right: ScreenSize.w(context) * 0.03,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Services', style: AppStyle.body19),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  ElevatedButton.icon(
                                    icon: Icon(Icons.add),
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        AppColor.primary,
                                      ),
                                      foregroundColor: WidgetStatePropertyAll(
                                        Colors.white,
                                      ),
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                    ),

                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder:
                                            (context) => ServiceFormFieldWidget(
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
                                                  name:
                                                      nameServiceController
                                                          .text,
                                                  description:
                                                      descriptionServiceController
                                                          .text,
                                                  price:
                                                      priceServiceController
                                                          .text,
                                                  categoryImageUrl:
                                                      imageUrlServiceControllwer
                                                          .text,
                                                  detailImageUrl:
                                                      imageUrlServiceControllwer
                                                          .text,
                                                  creatdAt:
                                                      DateTime.now().toString(),
                                                  time:
                                                      timeServiceController
                                                          .text,
                                                );
                                                await provService.addService(
                                                  serviceModel: serviceModel,
                                                );
                                                Navigator.of(context).pop();
                                              },
                                              labelButton: 'Add Service ',
                                              title: 'Add new Service',
                                            ),
                                      );
                                    },
                                    label: Text('Add New Service'),
                                  ),
                          
                                  SizedBox(width: 10),
                                  OutlinedButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.filter_alt_outlined),
                                    style: ButtonStyle(
                                      foregroundColor: WidgetStatePropertyAll(
                                        Colors.black,
                                      ),
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                    ),
                                    label: Text('Filter Bookings'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              provService.services.isNotEmpty
                                  ? Expanded(
                                    child: GridView.builder(
                                      itemCount: provService.services.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 20,
                                            crossAxisSpacing: 15,
                                            crossAxisCount:
                                                confegResposive.crossAxisCount!,
                                            childAspectRatio: 2 / 1.4,
                                          ),
                                      itemBuilder:
                                          (context, index) => Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                    top: Radius.circular(30),
                                                    bottom: Radius.circular(12),
                                                  ),
                                              color: AppColor.primary
                                                  .withOpacity(0.2),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                          top: Radius.circular(
                                                            12,
                                                          ),
                                                          bottom:
                                                              Radius.circular(
                                                                12,
                                                              ),
                                                        ),
                                                  ),
                                                  height:
                                                      confegResposive.imageSize,
                                                  width: double.infinity,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                          top: Radius.circular(
                                                            12,
                                                          ),
                                                          bottom:
                                                              Radius.circular(
                                                                12,
                                                              ),
                                                        ),
                                                    child: Image.network(
                                                      provService
                                                          .services[index]
                                                          .categoryImageUrl,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          confegResposive
                                                              .horizontalPadding,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height:
                                                                  ScreenSize.w(
                                                                    context,
                                                                  ) *
                                                                  0.006,
                                                            ),
                                                            Text(
                                                              provService
                                                                  .services[index]
                                                                  .name,

                                                              style: AppStyle
                                                                  .body17
                                                                  .copyWith(
                                                                    fontSize:
                                                                        confegResposive
                                                                            .titleFontSize,
                                                                  ),
                                                            ),
                                                            Text(
                                                              provService
                                                                  .services[index]
                                                                  .description,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: AppStyle
                                                                  .subTitle
                                                                  .copyWith(
                                                                    fontSize:
                                                                        confegResposive
                                                                            .titleFontSize,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              ScreenSize.w(
                                                                context,
                                                              ) *
                                                              0.005,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              '${provService.services[index].price} \$',
                                                              style: AppStyle.body15.copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color:
                                                                    Colors
                                                                        .green,
                                                                fontSize:
                                                                    confegResposive
                                                                        .titleFontSize,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  ScreenSize.w(
                                                                    context,
                                                                  ) *
                                                                  0.02,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .timer_outlined,
                                                                  size: 15,
                                                                ),
                                                                Text(
                                                                  '${provService.services[index].time} hours',

                                                                  style: AppStyle
                                                                      .body15
                                                                      .copyWith(
                                                                        fontSize:
                                                                            confegResposive.titleFontSize,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Spacer(),
                                                        SizedBox(
                                                          height:
                                                              confegResposive
                                                                  .buttonSize,
                                                          child: Row(
                                                            children: [
                                                              Expanded(
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
                                                                                id: provService.services[index].id,
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
                                                                              log(
                                                                                'Name',
                                                                              );
                                                                              log(
                                                                                nameServiceController.text,
                                                                              );
                                                                              await provService.updateService(
                                                                                serviceModel:
                                                                                    serviceModel,
                                                                              );

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
                                                              SizedBox(
                                                                width:
                                                                    ScreenSize.w(
                                                                      context,
                                                                    ) *
                                                                    0.01,
                                                              ),
                                                              Expanded(
                                                                child: OutlinedButton.icon(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .delete_forever_outlined,
                                                                    color:
                                                                        Colors
                                                                            .red,
                                                                  ),
                                                                  style: ButtonStyle(
                                                                    overlayColor: WidgetStatePropertyAll(
                                                                      Colors.red
                                                                          .withOpacity(
                                                                            0.3,
                                                                          ),
                                                                    ),
                                                                    shape: WidgetStatePropertyAll(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                              8,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  onPressed: () async {
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (
                                                                            context,
                                                                          ) => AlertDialog(
                                                                            actions: [
                                                                              OutlinedButton(
                                                                                style: ButtonStyle(
                                                                                  foregroundColor: WidgetStatePropertyAll(
                                                                                    Colors.black,
                                                                                  ),
                                                                                  overlayColor: WidgetStatePropertyAll(
                                                                                    Colors.red.withOpacity(
                                                                                      0.5,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                onPressed: () async {
                                                                                  await provService.deleteService(
                                                                                    serviceModel:
                                                                                        provService.services[index],
                                                                                  );
                                                                                  GoRouter.of(
                                                                                    context,
                                                                                  ).pop();
                                                                                },
                                                                                child: Text(
                                                                                  'Delete',
                                                                                ),
                                                                              ),
                                                                              OutlinedButton(
                                                                                style: ButtonStyle(
                                                                                  foregroundColor: WidgetStatePropertyAll(
                                                                                    Colors.black,
                                                                                  ),
                                                                                ),
                                                                                onPressed: () {
                                                                                  GoRouter.of(
                                                                                    context,
                                                                                  ).pop();
                                                                                },
                                                                                child: Text(
                                                                                  'Cancel',
                                                                                ),
                                                                              ),
                                                                            ],
                                                                            title: Text(
                                                                              'Confirm Deletion',
                                                                            ),
                                                                            content: Text(
                                                                              'Deleting this service will remove it permanently from the system and cannot be recovered',
                                                                            ),
                                                                          ),
                                                                    );
                                                                  },
                                                                  label: Text(
                                                                    'Delete',
                                                                    style: TextStyle(
                                                                      color:
                                                                          Colors
                                                                              .red,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Spacer(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                    ),
                                  )
                                  : SizedBox(
                                    height: ScreenSize.h(context) * 0.5,
                                    child: Center(
                                      child: Text(
                                        'There are currently no services available. Use the "Add New Service" button above to create one.',
                                        style: AppStyle.body30,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
