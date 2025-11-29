import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String message, Color? backgroundColor}) {
  Fluttertoast.showToast(
    fontSize: 16,
    toastLength: Toast.LENGTH_LONG,
    msg: message,
    backgroundColor: backgroundColor,
  );
}
