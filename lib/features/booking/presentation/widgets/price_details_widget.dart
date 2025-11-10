
import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';

class PriceDetailsWidget extends StatelessWidget {
  const PriceDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      height: 250,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 25,
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price Details', style: AppStyle.body15),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Service Fee',
                  style: AppStyle.body15,
                ),
                Text('\$49.00'),
              ],
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text('Tax', style: AppStyle.body15),
                Text('\$4.90'),
              ],
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'First Time Dicount(20%)',
                  style: AppStyle.body15.copyWith(
                    color: Colors.green,
                  ),
                ),
                Text(
                  '\$-9.00',
                  style: AppStyle.body15.copyWith(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount',
                  style: AppStyle.body15,
                ),
                Text(
                  '\$44.00',
                  style: AppStyle.body15.copyWith(
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
