import 'package:flutter/material.dart';

import '../utils/app_color.dart';

InputBorder outLineInputBorder({
  Color? color,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: color ?? AppColor.primaryColor,
    ),
  );
}
