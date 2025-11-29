import 'package:dream_home/core/extension/extension.dart';
import 'package:flutter/material.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';

class CustomGridViewItemBuilder extends StatelessWidget {
  final String vectors;
  final String jobName;
  final void Function()? onTap;
  const CustomGridViewItemBuilder({
    super.key,
    required this.vectors,
    required this.jobName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: AppColor.grey8,
            offset: Offset(5, 5),
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Flexible(
            flex: 5,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(vectors),
              backgroundColor: AppColor.yellowColor,
            ),
          ),
          Spacer(),
          Flexible(
            child: FittedBox(
              child: Text(
                jobName,
                textAlign: TextAlign.center,
                style: AppTextStyle.style16.copyWith(
                  color: AppColor.lightblack,
                ),
              ),
            ),
          )
        ],
      ),
    ).onTap(onTap);
  }
}
