import 'dart:developer';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomLocalization extends StatelessWidget {
  const CustomLocalization({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            log("English Language Selected");
            await context.setLocale(const Locale('en'));
          },
          child: Container(
            width: 100,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColor.yellowColor),
            ),
            child: Row(
              children: [
                Text("English"),
                width(4),
                Icon(Icons.translate_outlined, color: AppColor.yellowColor),
              ],
            ),
          ),
        ),
        height(8),
        InkWell(
          onTap: () async {
            log("Arabic Language Selected");
            await context.setLocale(const Locale('ar'));
          },
          child: Container(
            width: 100,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColor.yellowColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("العربية"),
                width(4),
                Icon(Icons.translate_outlined, color: AppColor.yellowColor),
              ],
            ),
          ),
        )
      ],
    );
  }
}
