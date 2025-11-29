import 'package:dream_home/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/routes.dart';
import '../../../../core/constant/app_sized.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_images.dart';

class CustomCustomerRowHeader extends StatelessWidget {
  final String name;
  const CustomCustomerRowHeader({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hi $name",
            style: AppTextStyle.style20.copyWith(),
          ),
          Image.asset(
            AppImages.logo,
            width: 100,
            height: 100,
          ),
          width(16),
          Icon(
            Icons.notifications_active,
            color: AppColor.yellowColor,
            size: 30,
          ).onTap(() {
            context.push(Routes.notification);
          })
        ],
      ),
    );
  }
}
