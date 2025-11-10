import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/booking/presentation/view_models/location_view_model.dart';

// ignore: must_be_immutable
class TextFieldServiceAddress extends StatefulWidget {
  String hint;

  TextFieldServiceAddress({required this.hint, super.key});

  @override
  State<TextFieldServiceAddress> createState() =>
      _TextFieldServiceAddressState();
}

class _TextFieldServiceAddressState extends State<TextFieldServiceAddress> {
  final TextEditingController serviceAddress = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final provLocation = Provider.of<LocationViewModel>(context);
    if (provLocation.address.isNotEmpty ) {
      serviceAddress.text = provLocation.address;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationViewModel>(
      builder:
          (context, provLocation, child) => TextField(
            controller: serviceAddress,
            onChanged: (value) {
              provLocation.selectServiceAddress(value);
              log(provLocation.address);
            },

            decoration: InputDecoration(
              prefixIcon: Icon(Icons.location_on_outlined),
              hintText: widget.hint,
              filled: true,
              hintStyle: AppStyle.hintTextStyle,
              prefixIconColor: Colors.grey,
              fillColor: AppColor.filledTextField,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(style: BorderStyle.none),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(style: BorderStyle.none),
              ),
            ),
          ),
    );
  }
}
