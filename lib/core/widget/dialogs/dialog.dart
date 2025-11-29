import 'package:flutter/material.dart';

import '../../constant/app_sized.dart';
import '../../utils/app_color.dart';

popupDropDownDialogs({
  required BuildContext context,
  required List<Widget> children,
  double? height,
  String? hintText,
  String? value,
}) {
  showDialog(
    context: context,
    builder: ((context) {
      return (Dialog(
        child: Container(
          height: height ?? heightSize(context) * .7,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColor.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    }),
  );
}
