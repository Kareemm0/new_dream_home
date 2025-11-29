import 'package:dream_home/core/service/on_boarding_service.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/feature/onborading/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routes/routes.dart';
import 'custom_next_button.dart';

class CustomButtonsRow extends StatelessWidget {
  const CustomButtonsRow({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomNextButton(
          onTap: () {
            if (pageController.hasClients) {
              pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          },
          icon: Icons.arrow_back,
          backGroundColor: AppColor.black,
        ),
        CustomNextButton(
          onTap: () async {
            if (pageController.hasClients) {
              if (pageController.page!.toInt() == onBoarding.length - 1) {
                await OnboardingService().markOnboardingAsShown();
                context.pushReplacement(Routes.login);
              } else {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            }
          },
          icon: Icons.arrow_forward,
          backGroundColor: AppColor.yellowColor,
        ),
      ],
    );
  }
}
