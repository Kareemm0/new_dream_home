import 'package:dream_home/Core/extension/extension.dart';
import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constant/app_sized.dart';

void showImagePickerDialog(BuildContext ctx,
    {required String cameraText,
    required String galleryText,
    required void Function()? cameraOnTap,
    required void Function()? galleryOnTap}) {
  showDialog(
    context: ctx,
    builder: (ctx) {
      return Dialog(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          height: heightSize(ctx) * 0.3,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                "chooseImage".tr(),
                style: AppTextStyle.style18.copyWith(
                  color: AppColor.lightblack,
                ),
              ),
              const Spacer(),
              //! Gallery
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    galleryText,
                    style: AppTextStyle.style16
                        .copyWith(color: AppColor.lightblack),
                  ),
                  const Icon(
                    Icons.photo_library_outlined,
                    size: 32,
                    color: AppColor.primaryColor,
                  ),
                ],
              ).onTap(galleryOnTap),
              height(32),
              //! Camera
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cameraText,
                    style: AppTextStyle.style16
                        .copyWith(color: AppColor.lightblack),
                  ),
                  const Icon(
                    Icons.camera_outlined,
                    size: 32,
                    color: AppColor.primaryColor,
                  ),
                ],
              ).onTap(cameraOnTap),
              const Spacer(),
            ],
          ),
        ),
      );
    },
  );
}
