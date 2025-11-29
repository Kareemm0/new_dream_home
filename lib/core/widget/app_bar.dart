import 'package:dream_home/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import '../styles/app_text_style.dart';

PreferredSizeWidget? appBar(
  BuildContext context, {
  required String title,
  List<Widget>? actions,
  bool automaticallyImplyLeading = true,
  Widget? leading,
  bool? isCenter,
}) {
  return AppBar(
    backgroundColor: AppColor.white,
    elevation: 0,
    surfaceTintColor: AppColor.white,
    automaticallyImplyLeading: automaticallyImplyLeading,
    title: Text(
      title,
      style: AppTextStyle.style24,
    ),
    actions: actions,
    leading: leading,
    centerTitle: isCenter ?? true,
  );
}
