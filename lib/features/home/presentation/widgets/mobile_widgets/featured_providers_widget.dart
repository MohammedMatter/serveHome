
import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';

class FeaturesProvidersWidget extends StatelessWidget {
   FeaturesProvidersWidget({super.key});
final List <String > workers = [
  'assets/images/workers/elctrical_worker.png',
  'assets/images/workers/cleaning_worker.png',
  'assets/images/workers/plumbing_worker.png',
  'assets/images/workers/decorating_worker.png',
]
 ; 
  @override
  Widget build(BuildContext context) {
  
    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),

                  color: Colors.white,
                ),
                margin: EdgeInsets.only(right: 15),
                height: 200,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 140, 170, 184),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),

                      child: SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Image.asset(
                         workers[index],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: AppStyle.body19.copyWith(fontSize: 15)
                          ),
                          Row(
                            children: [
                              Icon(
                                size: 20,
                                Icons.star,
                                color: AppColor.secondry,
                              ),
                              Icon(
                                size: 20,
                                Icons.star,
                                color: AppColor.secondry,
                              ),
                              Icon(
                                size: 20,
                                Icons.star,
                                color: AppColor.secondry,
                              ),
                              Icon(
                                size: 20,
                                Icons.star,
                                color: AppColor.secondry,
                              ),
                              Icon(
                                size: 20,
                                Icons.star,
                                color: AppColor.secondry,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        itemCount: workers.length,
      ),
    );
  }
}
