import 'package:flutter/material.dart';

import '../../../../core/constant/app_sized.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';

class CustomOrderListViewBody extends StatelessWidget {
  final String userName;
  final String orderStatus;
  final String phone;
  final String location;
  const CustomOrderListViewBody({
    super.key,
    required this.userName,
    required this.orderStatus,
    required this.phone,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: AppColor.beanut),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  userName,
                  style: AppTextStyle.style18.copyWith(
                    color: AppColor.lightblack,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  orderStatus,
                  style:
                      AppTextStyle.style16.copyWith(color: AppColor.lightblack),
                ),
              ],
            ),
            height(8),
            Text(
              phone,
              style: AppTextStyle.style18.copyWith(color: AppColor.lightblack),
            ),
            height(8),
            Text(
              location,
              style: AppTextStyle.style18.copyWith(color: AppColor.lightblack),
            ),
          ],
        ),
      ),
    );
  }
}
