import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomProfileItem extends StatelessWidget {
  final String text;
  final String svgIconPath;
  final bool? smallText;
  final VoidCallback onTap;
  final Color? textColor;
  final Color vectorColor;
  final Color? iconColor;

  const CustomProfileItem({
    super.key,
    required this.text,
    required this.svgIconPath,
    this.smallText = false,
    required this.onTap,
    this.textColor,
    required this.vectorColor,
    this.iconColor,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.yellowColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  height: 25,
                  width: 50,
                  svgIconPath,
                  colorFilter: ColorFilter.mode(vectorColor, BlendMode.srcIn),
                ),
                width(16),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: (smallText == true) ? 100 : 200,
                  ),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.style16.copyWith(color: textColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: iconColor ?? AppColor.white,
            )
          ],
        ),
      ),
    );
  }
}
