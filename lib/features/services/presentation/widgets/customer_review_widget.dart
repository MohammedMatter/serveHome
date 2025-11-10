
import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';

class CustomerReviewsWidget extends StatelessWidget {
  const CustomerReviewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Customer Reviews',
                style: AppStyle.body15
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: AppStyle.body15
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
    
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      foregroundImage: AssetImage('assets/images/workers/cleaning_worker.png'),
                      backgroundColor: AppColor.primary,
                    ),
                    SizedBox(width: 15),
                    Column(
                      children: [
                        Text('Mohammed Omar'),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text('2 days ago'),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.only(left: 55),
                  width: 280,
                  child: Text(
                    'Excellent service! Very professional and thorough.',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(20),
    
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(   radius: 30,
                      foregroundImage: AssetImage('assets/images/workers/cleaning_worker.png'),
                      backgroundColor: AppColor.secondry,
                    ),
                    SizedBox(width: 15),
                    Column(
                      children: [
                        Text('Mohammed Omar'),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text('2 days ago'),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.only(left: 55),
                  width: 280,
                  child: Text(
                    'Excellent service! Very professional and thorough.',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
