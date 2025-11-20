import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';

class SelectTimeWidget extends StatelessWidget {
  SelectTimeWidget({super.key});
  List times = [
    '11 : 00 Am',
    '12 : 00 Pm',
    '01 : 00 Pm',
    '02 : 00 Pm',
    '03 : 00 Pm',
    '04 : 00 Pm',
    '05 : 00 Pm',
    '06 : 00 Pm',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Time',
          style: AppStyle.body15.copyWith(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 15),
        Consumer<BookingViewModel>(
          builder:
              (context, provHome, child) => GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: times.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 8 / 4.4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                itemBuilder:
                    (context, index) => InkWell(
                      onTap: () {
                        provHome.changeTimeIndex(index);
                        provHome.selectTime(times[index]);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.2,
                            color:
                                provHome.timeIndex == index
                                    ? Color(0xff1f5d8c)
                                    : Colors.grey.withOpacity(0.4),
                          ),
                          color:
                              provHome.timeIndex == index
                                  ? Color(0xffeff6ff).withOpacity(0.7)
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              times[index],
                              style: AppStyle.subTitle.copyWith(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.timer_sharp, color: Colors.black),
                          ],
                        ),
                      ),
                    ),
              ),
        ),
      ],
    );
  }
}
