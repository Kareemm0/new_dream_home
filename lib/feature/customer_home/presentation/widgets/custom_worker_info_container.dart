import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:dream_home/core/utils/fade_animation_custom.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constant/app_sized.dart';
import '../../../../core/styles/app_text_style.dart';

class CustomWorkerInfoContainer extends StatelessWidget {
  final String name;
  final String phone;
  final double rating;

  const CustomWorkerInfoContainer({
    super.key,
    required this.name,
    required this.phone,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimationCustom(
      delay: 1.2,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.yellowColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.yellowColor,
                  ),
                  child: Image.asset(
                    AppImages.craft2,
                  ),
                ),
                width(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      toBeginningOfSentenceCase(name),
                      style: AppTextStyle.style18.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                    Text(
                      phone,
                      style: AppTextStyle.style18.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColor.yellowColor,
                ),
                Text(
                  rating.toString(),
                  style: AppTextStyle.style18.copyWith(
                    color: AppColor.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
