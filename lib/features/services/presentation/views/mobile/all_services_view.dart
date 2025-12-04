import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/bottom_navigation_bar_widget.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class AllServicesView extends StatelessWidget {
  const AllServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(),
      body: Consumer<ServiceViewModel>(
        builder:
            (context, provService, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          style: ButtonStyle(
                            iconSize: WidgetStatePropertyAll(25),
                            shape: WidgetStatePropertyAll(CircleBorder()),
                            backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                          child: Icon(Icons.arrow_back, color: Colors.black),
                        ),
                        Center(
                          child: Text('All Services', style: AppStyle.body19),
                        ),
                      ],
                    ),
                    Divider(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children:
                              provService.services
                                  .map(
                                    (service) => Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 20,
                                      ),
                                      child: Container(
                                        height: ScreenSize.h(context) * 0.40,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              offset: Offset(0, 10),
                                              blurRadius: 10,
                                            ),
                                          ],
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height:
                                                  ScreenSize.h(context) * 0.20,
                                              width: double.infinity,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                      top: Radius.circular(15),
                                                    ),
                                                child: Image.network(
                                                  fit: BoxFit.fill,
                                                  service.categoryImageUrl,
                                                  errorBuilder: (context, error, stackTrace) => Image.asset(
                                                    fit: BoxFit.fill ,
                                                    'assets/images/placeholderImage/placeholder.png'
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  14.0,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          service.name,
                                                          style:
                                                              AppStyle.body17,
                                                        ),
                                                        Text(
                                                          '(${service.category})',
                                                          style: AppStyle.body15
                                                              .copyWith(
                                                                color:
                                                                    AppColor
                                                                        .secondry,
                                                              ),
                                                        ),
                                                      ],
                                                    ),

                                                    Text(
                                                      service.description,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: AppStyle.body15,
                                                    ),

                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${service.price}\$',
                                                          style: TextStyle(
                                                            color:
                                                                const Color.fromARGB(
                                                                  255,
                                                                  38,
                                                                  165,
                                                                  42,
                                                                ),
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            provService
                                                                .selectService(
                                                                  service,
                                                                );
                                                            GoRouter.of(
                                                              context,
                                                            ).pushNamed(
                                                              AppRouter
                                                                  .serviceDetailsView,
                                                              extra:
                                                                  provService
                                                                      .selectedService,
                                                            );
                                                          },
                                                          style: ButtonStyle(
                                                            shape: WidgetStatePropertyAll(
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      15,
                                                                    ),
                                                              ),
                                                            ),
                                                            backgroundColor:
                                                                WidgetStatePropertyAll(
                                                                  AppColor
                                                                      .primary,
                                                                ),
                                                            foregroundColor:
                                                                WidgetStatePropertyAll(
                                                                  Colors.white,
                                                                ),
                                                          ),
                                                          child: Text(
                                                            'Book now',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
