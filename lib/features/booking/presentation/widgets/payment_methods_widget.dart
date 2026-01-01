import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';

class PaymentMethodsWidget extends StatelessWidget {
  PaymentMethodsWidget({super.key});

  final Map<String, Icon> paymentMethods = {
    'Credit/Debit Card': Icon(Icons.credit_card),
    'Cash': Icon(Icons.attach_money_outlined),
    'Apple Pay': Icon(Icons.apple),
  };

  @override
  Widget build(BuildContext context) {
    final double containerHeight = (ScreenSize.h(context) * 0.065).clamp(
      45,
      60,
    );
    final double horizontalPadding = (ScreenSize.w(context) * 0.025).clamp(
      8,
      12,
    );
    final double spacing = (ScreenSize.w(context) * 0.03).clamp(8, 12);
    final double fontSize = (ScreenSize.w(context) * 0.035).clamp(12, 16);
    final double iconSize = (ScreenSize.w(context) * 0.06).clamp(18, 25);

    return Consumer<BookingViewModel>(
      builder:
          (context, provBooking, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment Method',
                style: AppStyle.body16(context).copyWith(fontSize: fontSize),
              ),
              SizedBox(height: spacing),
              Column(
                children: List.generate(paymentMethods.length, (index) {
                  final methodName = paymentMethods.keys.elementAt(index);
                  final methodIcon = paymentMethods.values.elementAt(index);
                  final bool isSelected =
                      provBooking.paymentMethodIndex == index;

                  return InkWell(
                    onTap: () {
                      provBooking.changePaymentMethodIndex(index);
                      provBooking.selectPaymentMethod(methodName);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: spacing / 2),
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                            isSelected
                                ? Border.all(color: AppColor.primary, width: 1)
                                : null,
                        color: Color.fromARGB(179, 239, 246, 255),
                      ),
                      width: double.infinity,
                      height: containerHeight,
                      child: Row(
                        children: [
                          Icon(
                            methodIcon.icon,
                            color: Color(0xff686767),
                            size: iconSize,
                          ),
                          SizedBox(width: spacing),
                          Text(
                            methodName,
                            style: AppStyle.body15(
                              context,
                            ).copyWith(fontSize: fontSize),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
    );
  }
}
