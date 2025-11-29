import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:dream_home/core/widget/custom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

void logoutDialog(
  BuildContext context, {
  void Function()? onPressed,
  String? textTitle,
  String? textButton,
  Widget? widget,
}) {
  showDialog(
      context: context,
      builder: (context) {
        return widget ??
            AlertDialog(
              backgroundColor: AppColor.transparent,
              content: Container(
                padding:
                    EdgeInsets.only(top: 4, right: 16, left: 16, bottom: 16),
                width: double.maxFinite,
                height: heightSize(context) * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColor.yellowColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset(AppImages.cancel).onTap(() {
                      context.pop();
                    }),
                    height(16),
                    Text(
                      textTitle ?? "Are you sure you want to logout?",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.style18.copyWith(
                        color: AppColor.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    CustomAppButton(
                      text: textButton ?? "logout",
                      containerColor: AppColor.redED,
                      textColor: AppColor.white,
                      borderColor: AppColor.redED,
                      onPressed: onPressed,
                    )
                  ],
                ),
              ),
            );
      });
}
