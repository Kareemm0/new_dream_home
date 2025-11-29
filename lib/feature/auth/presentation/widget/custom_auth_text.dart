import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/routes.dart';

class CustomAuthText extends StatelessWidget {
  final bool isLoadgin;
  final Color? textColor;
  const CustomAuthText({super.key, required this.isLoadgin, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(isLoadgin ? "NoAccount".tr() : "HaveAccount".tr(),
            style: AppTextStyle.style14),
        Text(isLoadgin ? "SignupHere".tr() : "LoginHere".tr(),
            style: AppTextStyle.style16.copyWith(
              color: textColor ?? AppColor.white,
            )).onTap(() {
          isLoadgin
              ? context.push(Routes.register)
              : context.push(Routes.login);
        })
      ],
    );
  }
}
