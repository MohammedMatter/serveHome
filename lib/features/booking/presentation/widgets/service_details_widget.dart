
import 'package:flutter/material.dart';
import 'package:serve_home/core/styles/app_style.dart';

class ServiceDetailsWidget extends StatelessWidget {
  const ServiceDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 5),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Service details', style: AppStyle.body15),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Service', style: AppStyle.body15),
                  Text('House Cleaning', style: AppStyle.body15),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Date&Time', style: AppStyle.body15),
                  Text(
                    '5/10/2025 at 9:00 Am',
                    style: AppStyle.body15,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Address', style: AppStyle.body15),
                  Text('Gaza', style: AppStyle.body15),
                ],
              ),
              SizedBox(height: 10),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Payment Method ', style: AppStyle.body15),
                  Text(
                    'Crediat / Debit Card',
                    style: AppStyle.body15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
