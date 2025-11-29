import 'package:flutter/material.dart';

import '../../../../core/styles/app_text_style.dart';

class CustomChooseYourJob extends StatelessWidget {
  final String image;
  final String text;
  const CustomChooseYourJob(
      {super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 100,
          width: 100,
        ),
        Text(text, style: AppTextStyle.style16),
      ],
    );
  }
}
