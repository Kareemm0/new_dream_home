import 'package:flutter/material.dart';

import '../../../../Core/styles/app_text_style.dart';
import '../../../../core/function/out_line_input_border.dart';
import '../../../../core/utils/app_color.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Color? errorColor;
  final bool? enabled;
  final Color? hintColor;
  final Color? textInputColor;
  final int? maxLength;
  const CustomTextFormFiled(
      {super.key,
      required this.controller,
      this.hintText,
      this.validator,
      this.obscureText = false,
      this.suffixIcon,
      this.borderColor,
      this.errorColor,
      this.enabled,
      this.hintColor,
      this.textInputColor,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLength,
      enabled: enabled,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      style: AppTextStyle.style14
          .copyWith(color: textInputColor ?? AppColor.white),
      decoration: InputDecoration(
        hintStyle:
            AppTextStyle.style14.copyWith(color: hintColor ?? AppColor.white),
        hintText: hintText,
        hintFadeDuration: Duration(seconds: 1),
        suffixIcon: suffixIcon,
        border: outLineInputBorder(color: borderColor),
        focusedBorder: outLineInputBorder(color: borderColor),
        enabledBorder: outLineInputBorder(color: borderColor),
        errorBorder: outLineInputBorder(color: errorColor),
        focusedErrorBorder: outLineInputBorder(color: borderColor),
        disabledBorder: outLineInputBorder(color: borderColor),
      ),
    );
  }
}
