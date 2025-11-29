import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/utils/app_images.dart';
import '../../../../app/routes/routes.dart';
import '../../../../core/cache/user_info_cache.dart';
import '../../../../core/constant/app_sized.dart';
import '../../../../core/service/on_boarding_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isCentered = false;
  bool _isExpanded = false;
  LoginModel? _user;

  @override
  void initState() {
    super.initState();
    _startAnimation();
    load();
  }

  Future<void> load() async {
    LoginModel? user = await getUserFromSharedPreferences();
    setState(() {
      _user = user;
    });
  }

  void _startAnimation() async {
    //! 500 ms delay before starting the animation
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _isCentered = true;
    });

    //! 1 sec delay before expanding
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isExpanded = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    context.pushReplacement(Routes.onboarding);
    bool onboardingShown = await OnboardingService().isOnboardingShown();

    if (onboardingShown) {
      if (_user?.user?.id! == null) {
        context.pushReplacement(Routes.login);
      } else {
        _user!.user!.role == 'employee'
            ? context.pushReplacement(Routes.workernavbar)
            : context.pushReplacement(Routes.customernavbar);
      }
    } else {
      context.pushReplacement(Routes.onboarding);
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    final screenWidth = widthSize(context);
    final screenHeight = heightSize(context);

    return Scaffold(
      backgroundColor: _isExpanded ? AppColor.yellowColor : AppColor.white,
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        alignment: _isCentered ? Alignment.center : Alignment.centerLeft,
        color: _isExpanded ? AppColor.yellowColor : AppColor.white,
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          width: _isExpanded ? screenWidth : 100,
          height: _isExpanded ? screenHeight : 100,
          child: Image.asset(
            AppImages.logo,
            fit: _isExpanded ? BoxFit.fill : BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
