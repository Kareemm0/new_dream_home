import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/feature/onborading/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/custom_localization.dart';
import '../widget/custom_row_buttons.dart';
import '../widget/custom_skip_on_boarding_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomVisibleSkipButton(
                pageController: pageController,
              ),
              CustomLocalization(),
            ],
          ),
          height(16),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    onBoarding[index].title,
                    style: AppTextStyle.style25.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Image.asset(onBoarding[index].image),
                  Text(
                    onBoarding[index].subTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.style20,
                  ),
                ],
              ),
              itemCount: onBoarding.length,
            ),
          ),
          height(64),
          CustomButtonsRow(
            pageController: pageController,
          ),
        ],
      ),
    ));
  }
}
