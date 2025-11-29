import 'package:flutter/material.dart';

class CustomChooseAccountType extends StatelessWidget {
  final String image;
  final String text;
  const CustomChooseAccountType(
      {super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          spacing: 16,
          children: [
            Image.asset(
              image,
              height: 50,
              width: 50,
            ),
            Text(text),
          ],
        ));
  }
}
