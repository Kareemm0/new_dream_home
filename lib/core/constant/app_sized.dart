import 'package:flutter/material.dart';

Widget height(double h) {
  return SizedBox(height: h);
}

Widget width(double w) {
  return SizedBox(width: w);
}

double heightSize(ctx) {
  return MediaQuery.sizeOf(ctx).height;
}

double widthSize(ctx) {
  return MediaQuery.sizeOf(ctx).width;
}
