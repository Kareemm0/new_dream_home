import 'package:flutter/material.dart';

extension TapCallbackExtension on Widget {
  Widget onTap(VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }
}
