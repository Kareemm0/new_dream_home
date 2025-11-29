import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomDropDownContainer extends StatelessWidget {
  final String hint;
  final List<DropdownMenuItem<Object?>>? items;
  final void Function(dynamic)? onChanged;
  final BorderRadiusGeometry? borderRadius;
  final Color? hintColor;
  final dynamic value;
  const CustomDropDownContainer(
      {super.key,
      required this.hint,
      this.items,
      this.onChanged,
      this.borderRadius,
      this.hintColor,
      this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        border: Border.all(color: AppColor.primaryColor),
      ),
      child: DropdownButton(
        dropdownColor: AppColor.beanut,
        menuMaxHeight: heightSize(context) * 0.3,
        menuWidth: widthSize(context) * 0.6,
        value: value,
        icon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          size: 25,
          color: AppColor.grey8,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        isExpanded: true,
        underline: Container(),
        hint: Text(
          hint,
          style: AppTextStyle.style14
              .copyWith(color: hintColor ?? AppColor.lightblack),
        ),
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
