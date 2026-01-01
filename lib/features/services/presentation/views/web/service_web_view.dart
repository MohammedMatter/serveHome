import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/responsive_config.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/home/presentation/widgets/web_widgets/drawer_widget.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';
import 'package:serve_home/features/services/presentation/widgets/services_web_widget/actrion_service_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/services_web_widget/add_service_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/services_web_widget/image_service_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/services_web_widget/service_details_widget.dart';

class ServicesWebView extends StatefulWidget {
  @override
  State<ServicesWebView> createState() => _ServicesWebViewState();
}

class _ServicesWebViewState extends State<ServicesWebView> {
  TextEditingController nameServiceController = TextEditingController();

  TextEditingController descriptionServiceController = TextEditingController();

  TextEditingController priceServiceController = TextEditingController();

  TextEditingController timeServiceController = TextEditingController();

  TextEditingController categoryServiceController = TextEditingController();

  TextEditingController imageUrlServiceControllwer = TextEditingController();
  void initState() {
    super.initState();
    final provService = Provider.of<ServiceViewModel>(context, listen: false);
    provService.getServices();
  }

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
                              SizedBox(
                                width: double.infinity,
                                child: Wrap(
                                  alignment: WrapAlignment.spaceBetween,
                                  runSpacing:
                                      10,
                                
                                  children: [
                                 
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Services Management',
                                          style: AppStyle.body19(context),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Manage all available services in your platform',
                                          style: AppStyle.body15(context),
                                        ),
                                      ],
                                    ),

                                   
                                    AddServiceWidget(
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
                                    ),
                                  ],
                                ),
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
                                            childAspectRatio: 2 / 1.6,
                                          ),
                                      itemBuilder:
                                          (context, index) => MouseRegion(
                                            onEnter: (_) {
                                              provService.selectService(
                                                provService.services[index],
                                              );
                                              provService.isContainerHovered(
                                                true,
                                              );
                                            },
                                            onExit: (_) {
                                              provService.isContainerHovered(
                                                false,
                                              );
                                            },
                                            cursor: SystemMouseCursors.click,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow:
                                                    provService.isHovered &&
                                                            provService.services
                                                                    .indexOf(
                                                                      provService
                                                                          .selectedService!,
                                                                    ) ==
                                                                index
                                                        ? [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            blurRadius: 5,
                                                            offset: Offset(
                                                              0,
                                                              10,
                                                            ),
                                                          ),
                                                        ]
                                                        : null,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                      top: Radius.circular(30),
                                                      bottom: Radius.circular(
                                                        12,
                                                      ),
                                                    ),
                                                color: AppColor.primary
                                                    .withOpacity(0.2),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ImageServiceWidget(
                                                    imageUrl:
                                                        provService
                                                            .services[index]
                                                            .categoryImageUrl,
                                                    imageSize:
                                                        confegResposive
                                                            .imageSize!,
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
                                                          ServiceDetailsWebWidget(
                                                            category:
                                                                provService
                                                                    .services[index]
                                                                    .category,
                                                            confegResposive:
                                                                confegResposive,
                                                            name:
                                                                provService
                                                                    .services[index]
                                                                    .name,
                                                            description:
                                                                provService
                                                                    .services[index]
                                                                    .description,
                                                            price:
                                                                provService
                                                                    .services[index]
                                                                    .price,
                                                            time:
                                                                provService
                                                                    .services[index]
                                                                    .time,
                                                          ),
                                                          Spacer(),
                                                          SizedBox(
                                                            height:
                                                                confegResposive
                                                                    .buttonSize,
                                                            child: ActionServiceWidget(
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
                                                              id:
                                                                  provService
                                                                      .services[index]
                                                                      .id,
                                                              serviceModel:
                                                                  provService
                                                                      .services[index],
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
                                    ),
                                  )
                                  : provService.isLoading == true
                                  ? SizedBox(
                                    height: ScreenSize.h(context) * 0.5,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: AppColor.primary,
                                      ),
                                    ),
                                  )
                                  : SizedBox(
                                    height: ScreenSize.h(context) * 0.5,
                                    child: Center(
                                      child: Text(
                                        'There are currently no services available. Use the "Add New Service" button above to create one.',
                                        style: AppStyle.body30(context),
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
