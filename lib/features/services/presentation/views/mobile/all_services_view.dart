
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/bottom_navigation_bar_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/search_widget.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class AllServicesView extends StatefulWidget {
  const AllServicesView({super.key});

  @override
  State<AllServicesView> createState() => _AllServicesViewState();
}

class _AllServicesViewState extends State<AllServicesView> {
  TextEditingController search = TextEditingController();

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

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
                    Center(child: Text('All Services', style: AppStyle.body19)),
                    Divider(),
                    SizedBox(height: 10),
                    SearchWidget(search: search),
                    SizedBox(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children:
                              provService.servicesFilterList.isNotEmpty
                                  ? provService.servicesFilterList
                                      .map(
                                        (service) => Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 20,
                                          ),
                                          child: Container(
                                            height:
                                                ScreenSize.h(context) * 0.40,
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
                                                      ScreenSize.h(context) *
                                                      0.20,
                                                  width: double.infinity,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                          top: Radius.circular(
                                                            15,
                                                          ),
                                                        ),
                                                    child: Image.network(
                                                      fit: BoxFit.fill,
                                                      service.categoryImageUrl,
                                                      errorBuilder:
                                                          (
                                                            context,
                                                            error,
                                                            stackTrace,
                                                          ) => Image.asset(
                                                            fit: BoxFit.fill,
                                                            'assets/images/placeholderImage/placeholder.png',
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          14.0,
                                                        ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              service.name,
                                                              style:
                                                                  AppStyle
                                                                      .body17,
                                                            ),
                                                            Text(
                                                              '(${service.category})',
                                                              style: AppStyle
                                                                  .body15
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
                                                              TextOverflow
                                                                  .ellipsis,
                                                          style:
                                                              AppStyle.body15,
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
                                                                    FontWeight
                                                                        .bold,
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
                                                                      Colors
                                                                          .white,
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
                                      .toList()
                                  : [
                                    SizedBox(height: ScreenSize.h(context)*0.3,) , 
                                     Center(
                                      child: Text(
                                        'No services matched your search',
                                        style: AppStyle.body16,
                                      ),
                                    ),
                                  ],
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
