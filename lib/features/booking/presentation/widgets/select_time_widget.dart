import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';

class SelectTimeWidget extends StatelessWidget {
  SelectTimeWidget({super.key});
  final List<String> times = [
    '11 : 00 AM',
    '12 : 00 PM',
    '01 : 00 PM',
    '02 : 00 PM',
    '03 : 00 PM',
    '04 : 00 PM',
    '05 : 00 PM',
    '06 : 00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    final double titleFontSize = (ScreenSize.w(context) * 0.04).clamp(14, 18);
    final double gridSpacing = (ScreenSize.w(context) * 0.02).clamp(8, 15);
    final double borderRadius = (ScreenSize.w(context) * 0.03).clamp(10, 16);
    final double fontSize = (ScreenSize.w(context) * 0.035).clamp(12, 16);
    final double childAspectRatio = ScreenSize.w(context) / ScreenSize.h(context) * 2.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Time',
          style: AppStyle.body15(context).copyWith(
            color: Colors.black,
            fontSize: titleFontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: gridSpacing),
        Consumer<BookingViewModel>(
          builder: (context, provBooking, child) => GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: times.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ScreenSize.w(context) > 500 ? 3 : 2,
              mainAxisSpacing: gridSpacing,
              crossAxisSpacing: gridSpacing,
              childAspectRatio: childAspectRatio,
            ),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                provBooking.changeTimeIndex(index);
                provBooking.selectTime(times[index]);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: provBooking.timeIndex == index
                        ? Color(0xff1f5d8c)
                        : Colors.grey.withOpacity(0.4),
                  ),
                  color: provBooking.timeIndex == index
                      ? Color(0xffeff6ff).withOpacity(0.7)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      times[index],
                      style: AppStyle.subTitle(context).copyWith(
                        fontSize: fontSize,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: gridSpacing / 2),
                    Icon(
                      Icons.timer_sharp,
                      color: Colors.black,
                      size: fontSize + 4,
                    ),
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
