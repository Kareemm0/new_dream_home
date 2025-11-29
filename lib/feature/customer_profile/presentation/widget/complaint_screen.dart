import 'package:dream_home/core/extension/extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/app_sized.dart';
import '../../../../core/function/validation.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widget/custom_app_button.dart';
import '../../../auth/presentation/widget/custom_text_form_filed.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back_ios, color: AppColor.yellowColor)
                .onTap(context.pop),
            height(24),
            Text(
              "SendComplaint".tr(),
              style: AppTextStyle.style24.copyWith(color: AppColor.lightblack),
            ),
            Spacer(),
            CustomTextFormFiled(
              maxLength: 10,
              controller: TextEditingController(),
              hintText: "YourComplaint".tr(),
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
    );
  }
}
