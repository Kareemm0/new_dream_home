import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/utils/fade_animation_custom.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: FadeAnimationCustom(
          delay: 1.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back_ios, color: AppColor.yellowColor)
                  .onTap(context.pop),
              height(24),
              Text(
                "AboutTitle".tr(),
                style: AppTextStyle.style24.copyWith(color: AppColor.black),
              ),
              height(8),
              Text(
                "AboutText".tr(),
                style: AppTextStyle.style16.copyWith(color: AppColor.black),
              ),
              height(24),
              Text(
                "VisionTile".tr(),
                style: AppTextStyle.style24.copyWith(color: AppColor.black),
              ),
              height(8),
              Text(
                "VisionText".tr(),
                style: AppTextStyle.style16.copyWith(color: AppColor.black),
              ),
              height(24),
              Text(
                "MissionTitle".tr(),
                style: AppTextStyle.style24.copyWith(color: AppColor.black),
              ),
              height(8),
              Text(
                "missionText".tr(),
                style: AppTextStyle.style16.copyWith(color: AppColor.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
