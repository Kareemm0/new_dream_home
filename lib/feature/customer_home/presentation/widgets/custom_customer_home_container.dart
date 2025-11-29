import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constant/app_sized.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';

class CustomCustomerHomeContainer extends StatelessWidget {
  final String? text;
  final String name;
  final String image;
  const CustomCustomerHomeContainer(
      {super.key, this.text, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColor.yellowColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(AppImages.craft2),
                  ),
                  width(16), width(16),
                  //! Change static name with name back from firebase
                  Text(
                    "Hi $name",
                    style: AppTextStyle.style20.copyWith(
                      color: AppColor.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              Icon(
                Icons.notifications_active,
                color: AppColor.white,
                size: 30,
              ).onTap(() {
                context.push(Routes.notification);
              })
            ],
          ),
          Spacer(),
          Text(
            text ?? "Recommended Professions",
            style: AppTextStyle.style20.copyWith(
              color: AppColor.white,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
