import 'package:flutter/material.dart';

import '../../../../core/constant/app_sized.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widget/custom_app_button.dart';

class CustomAcceptOrDeclinOrder extends StatelessWidget {
  final String name;
  final void Function()? acceptonPressed;
  final void Function()? declineonPressed;
  const CustomAcceptOrDeclinOrder(
      {super.key,
      required this.name,
      this.acceptonPressed,
      this.declineonPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        height: heightSize(context) * 0.2,
        width: widthSize(context) * 0.1,
        decoration: BoxDecoration(
          color: AppColor.beanut,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              "Order From $name",
              style: AppTextStyle.style16.copyWith(color: AppColor.white),
            ),
            Spacer(),
            Row(
              children: [
                Flexible(
                  child: CustomAppButton(
                    text: "Accept",
                    containerColor: AppColor.green,
                    textColor: AppColor.white,
                    onPressed: acceptonPressed,
                  ),
                ),
                width(16),
                Flexible(
                  child: CustomAppButton(
                    text: "Decline",
                    containerColor: AppColor.redED,
                    textColor: AppColor.white,
                    onPressed: declineonPressed,
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
