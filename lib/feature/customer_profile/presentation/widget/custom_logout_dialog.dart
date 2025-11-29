import 'package:dream_home/core/utils/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/styles/app_text_style.dart';
import '../../../../core/constant/app_sized.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widget/custom_app_button.dart';

class CustomLogoutDialog extends StatelessWidget {
  final void Function()? onPressed;
  const CustomLogoutDialog({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.yellowColor,
        ),
        height: heightSize(context) * .46,
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            Image.asset(AppImages.logoutLogo),
            Text(
              "leave".tr(),
              style: AppTextStyle.style16.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColor.primaryColor,
              ),
            ),
            Text(
              "sureLogout".tr(),
              style: AppTextStyle.style14.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColor.redED,
              ),
            ),
            Row(
              spacing: 16,
              children: [
                Flexible(
                  child: CustomAppButton(
                    height: 48,
                    text: "no".tr(),
                    containerColor: AppColor.black,
                    textColor: AppColor.white,
                    onPressed: () => context.pop(),
                  ),
                ),
                Flexible(
                    child: CustomAppButton(
                  text: "yes".tr(),
                  onPressed: onPressed,
                  containerColor: AppColor.redED,
                  height: 48,
                  textColor: AppColor.white,
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
