import 'package:dream_home/core/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppImages.load),
    );
  }
}
