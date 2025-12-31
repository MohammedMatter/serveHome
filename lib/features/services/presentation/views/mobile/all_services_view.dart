import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final double cardRadius = (ScreenSize.w(context) * 0.02).clamp(12, 20);
    final double cardWidth = ScreenSize.w(context) > 600 ? 600 : double.infinity;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarWidget(),
        body: Consumer<ServiceViewModel>(
          builder: (context, provService, child) => SafeArea(
            child: Padding(
              padding: EdgeInsets.all(ScreenSize.w(context) * 0.04),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'All Services',
                      style: AppStyle.body19.copyWith(
                        fontSize: (ScreenSize.w(context) * 0.05).clamp(18, 26),
                      ),
                    ),
                  ),
                  Divider(height: ScreenSize.h(context) * 0.02),
                  SizedBox(height: ScreenSize.h(context) * 0.01),
                  SearchWidget(search: search),
                  SizedBox(height: ScreenSize.h(context) * 0.02),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: provService.servicesFilterList.isNotEmpty
                            ? provService.services.map(
                                (service) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: ScreenSize.h(context) * 0.02),
                                    child: Container(
                                      width: cardWidth,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(cardRadius),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 10,
                                            offset: Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height:
                                                (ScreenSize.h(context) * 0.25)
                                                    .clamp(150, 300),
                                            width: double.infinity,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(cardRadius),
                                              ),
                                              child: Image.network(
                                                service.categoryImageUrl,
                                                fit: BoxFit.cover,
                                                errorBuilder:
                                                    (context, error, stackTrace) =>
                                                        Image.asset(
                                                  'assets/images/placeholderImage/placeholder.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(
                                                ScreenSize.w(context) * 0.04),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        service.name,
                                                        style: AppStyle.body17
                                                            .copyWith(
                                                          fontSize:
                                                              (ScreenSize.w(context) *
                                                                      0.045)
                                                                  .clamp(16, 22),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '(${service.category})',
                                                      style: AppStyle.body15
                                                          .copyWith(
                                                        color:
                                                            AppColor.secondry,
                                                        fontSize:
                                                            (ScreenSize.w(context) *
                                                                    0.04)
                                                                .clamp(14, 20),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height:
                                                        ScreenSize.h(context) *
                                                            0.01),
                                                Text(
                                                  service.description,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: AppStyle.body15
                                                      .copyWith(
                                                    fontSize:
                                                        (ScreenSize.w(context) *
                                                                0.04)
                                                            .clamp(14, 20),
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        ScreenSize.h(context) *
                                                            0.015),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${service.price}\$',
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 38, 165, 42),
                                                        fontSize:
                                                            (ScreenSize.w(context) *
                                                                    0.05)
                                                                .clamp(16, 24),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        provService.selectService(
                                                            service);
                                                        GoRouter.of(context)
                                                            .pushNamed(
                                                          AppRouter
                                                              .serviceDetailsView,
                                                          extra: provService
                                                              .selectedService,
                                                        );
                                                      },
                                                      style: ButtonStyle(
                                                        shape:
                                                            WidgetStatePropertyAll(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    cardRadius),
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                            WidgetStatePropertyAll(
                                                                AppColor.primary),
                                                        foregroundColor:
                                                            WidgetStatePropertyAll(
                                                                Colors.white),
                                                        padding:
                                                            MaterialStatePropertyAll(
                                                          EdgeInsets.symmetric(
                                                            vertical: (ScreenSize
                                                                        .h(context) *
                                                                    0.015)
                                                                .clamp(8, 15),
                                                            horizontal: (ScreenSize
                                                                        .w(context) *
                                                                    0.03)
                                                                .clamp(12, 20),
                                                          ),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'Book now',
                                                        style: AppStyle.body16
                                                            .copyWith(
                                                              color: Colors.white,
                                                          fontSize:
                                                              (ScreenSize.w(context) *
                                                                      0.04)
                                                                  .clamp(14, 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ).toList()
                            : [
                                SizedBox(
                                  height: ScreenSize.h(context) * 0.3,
                                ),
                                Center(
                                  child: Text(
                                    'No services matched your search',
                                    style: AppStyle.body16.copyWith(
                                      fontSize: (ScreenSize.w(context) * 0.045)
                                          .clamp(16, 22),
                                    ),
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
      ),
    );
  }
}
