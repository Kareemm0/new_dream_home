import 'package:dream_home/core/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_sized.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_images.dart';

class CustomOrderDataBody extends StatelessWidget {
  final String userName;
  final String userLoation;
  final String phone;
  final String orderStatus;
  const CustomOrderDataBody(
      {super.key,
      required this.userName,
      required this.userLoation,
      required this.phone,
      required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.lightblack),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColor.beanut,
                backgroundImage: AssetImage(AppImages.vec1),
              ),
              width(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: AppTextStyle.style16
                        .copyWith(color: AppColor.lightblack),
                  ),
                  Text(
                    phone,
                    style: AppTextStyle.style16
                        .copyWith(color: AppColor.lightblack),
                  ),
                  Text(
                    userLoation.split(' ').take(3).join(' '),
                    style: AppTextStyle.style14
                        .copyWith(color: AppColor.lightblack),
                  ),
                ],
              ),
            ],
          ),
          Text(
            orderStatus,
            style: AppTextStyle.style16.copyWith(color: AppColor.lightblack),
          ),
        ],
      ),
    );
  }
}
