import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class CategoryServicesView extends StatelessWidget {
  const CategoryServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = ScreenSize.w(context);
    final double screenHeight = ScreenSize.h(context);
    final double cardRadius = (screenWidth * 0.03).clamp(12, 20);
    final double cardHeight = (screenHeight * 0.4).clamp(220, 400);

    return Scaffold(
      body: Consumer<ServiceViewModel>(
        builder: (context, provService, child) => SafeArea(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => GoRouter.of(context).pop(),
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(CircleBorder()),
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).scaffoldBackgroundColor),
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.all(screenWidth * 0.03),
                        ),
                      ),
                      child: Icon(Icons.arrow_back, color: Colors.black, size: screenWidth * 0.06),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Expanded(
                      child: Text(
                        'Services in ${provService.selectedCategory}',
                        style: AppStyle.body19(context).copyWith(
                          fontSize: (screenWidth * 0.05).clamp(18, 26),
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Divider(height: screenHeight * 0.02),
                Expanded(
                  child: provService.servicesFilterList.isNotEmpty
                      ? ListView.builder(
                          itemCount: provService.servicesFilterList.length,
                          itemBuilder: (context, index) {
                            final service = provService.servicesFilterList[index];
                            return Padding(
                              padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                              child: Container(
                                height: cardHeight,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(cardRadius),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: cardHeight * 0.45,
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(cardRadius)),
                                        child: Image.network(
                                          service.categoryImageUrl,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) => Image.asset(
                                            'assets/images/placeholderImage/placeholder.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(screenWidth * 0.04),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    service.name,
                                                    style: AppStyle.body17(context).copyWith(
                                                      fontSize: (screenWidth * 0.045).clamp(16, 22),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Text(
                                                  '(${service.category})',
                                                  style: AppStyle.body15(context).copyWith(
                                                    color: AppColor.secondry,
                                                    fontSize: (screenWidth * 0.04).clamp(14, 20),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              service.description,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppStyle.body15(context).copyWith(
                                                fontSize: (screenWidth * 0.04).clamp(14, 20),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '${service.price}\$',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(255, 38, 165, 42),
                                                    fontSize: (screenWidth * 0.05).clamp(16, 24),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    provService.selectService(service);
                                                    GoRouter.of(context).pushNamed(
                                                      AppRouter.serviceDetailsView,
                                                      extra: provService.selectedService,
                                                    );
                                                  },
                                                  style: ButtonStyle(
                                                    shape: MaterialStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(cardRadius)),
                                                    ),
                                                    backgroundColor: MaterialStatePropertyAll(AppColor.primary),
                                                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                                                    padding: MaterialStatePropertyAll(
                                                      EdgeInsets.symmetric(
                                                        vertical: (screenHeight * 0.015).clamp(8, 15),
                                                        horizontal: (screenWidth * 0.03).clamp(12, 20),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Book now',
                                                    style: AppStyle.body16(context).copyWith(
                                                      color: Colors.white,
                                                      fontSize: (screenWidth * 0.04).clamp(14, 20),
                                                    ),
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
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            'No services matched your search',
                            style: AppStyle.body16(context).copyWith(
                              fontSize: (screenWidth * 0.045).clamp(16, 22),
                            ),
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
