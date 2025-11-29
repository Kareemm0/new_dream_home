import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/function/validation.dart';
import 'package:dream_home/core/utils/fade_animation_custom.dart';
import 'package:dream_home/core/widget/custom_app_button.dart';
import 'package:dream_home/feature/auth/presentation/widget/custom_text_form_filed.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: FadeAnimationCustom(
          delay: 1.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back_ios, color: AppColor.yellowColor)
                  .onTap(context.pop),
              height(24),
              Text(
                "SendProblem".tr(),
                style: AppTextStyle.style24.copyWith(color: AppColor.black),
              ),
              Spacer(),
              CustomTextFormFiled(
                maxLength: 10,
                controller: TextEditingController(),
                hintText: "YourProblem".tr(),
                textInputColor: AppColor.black,
                hintColor: AppColor.black,
                borderColor: AppColor.yellowColor,
                validator: (val) {
                  return AppValidation.displayNameValidator(
                      TextEditingController().text);
                },
              ),
              Spacer(),
              CustomAppButton(
                text: "send".tr(),
                containerColor: AppColor.yellowColor,
                textColor: AppColor.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
