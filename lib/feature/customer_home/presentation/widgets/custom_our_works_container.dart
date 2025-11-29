import 'package:dream_home/Core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_sized.dart';

class CustomOurWorksContainer extends StatelessWidget {
  final String images;
  const CustomOurWorksContainer({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.beanut,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppColor.grey8,
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(images),
                fit: BoxFit.cover,
              ),
            ),
          ),
          width(10),
          Expanded(
            child: Text(
              "Kareem",
              style: AppTextStyle.style14.copyWith(color: AppColor.white),
            ),
          ),
        ],
      ),
    );
  }
}
