import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/widget/custom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/app_sized.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';
import '../../../auth/presentation/widget/custom_text_form_filed.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back_ios, color: AppColor.beanut)
                .onTap(context.pop),
            height(24),
            Text(
              "Change Password",
              style: AppTextStyle.style24.copyWith(color: AppColor.lightblack),
            ),
            height(50),
            CustomTextFormFiled(
              controller: TextEditingController(),
              hintText: "Password",
            ),
            Spacer(),
            CustomAppButton(
              text: "Send",
              containerColor: AppColor.beanut,
              textColor: AppColor.white,
            )
          ],
        ),
      ),
    );
  }
}
