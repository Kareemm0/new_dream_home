import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/function/show_toast.dart';
import 'package:dream_home/core/function/validation.dart';
import 'package:dream_home/core/widget/custom_loader.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/login_model.dart';
import 'package:dream_home/feature/auth/presentation/widget/custom_text_form_filed.dart';
import 'package:dream_home/feature/customer_profile/presentation/cubit/customer_profile_cubit/customer_profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/cache/user_info_cache.dart';
import '../../../../core/constant/app_sized.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/fade_animation_custom.dart';
import '../../../../core/widget/custom_app_button.dart';

class ChangeNumberScreen extends StatefulWidget {
  const ChangeNumberScreen({super.key});

  @override
  State<ChangeNumberScreen> createState() => _ChangeNumberScreenState();
}

class _ChangeNumberScreenState extends State<ChangeNumberScreen> {
  LoginModel? _user;
  bool _isLoading = true;

  Future<void> load() async {
    LoginModel? user = await getUserFromSharedPreferences();
    if (mounted) {
      setState(() {
        _user = user;
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(body: const Center(child: CustomLoader()));
    }

    if (_user == null || _user?.user?.id == null) {
      return Scaffold(
          body: Center(child: Text("Failed to load user data".tr())));
    }

    return BlocProvider(
      create: (context) => CustomerProfileCubit(logoutRepo: getIt(), getIt())
        ..getUserInfo(_user!.user!.id!),
      child: BlocConsumer<CustomerProfileCubit, CustomerProfileState>(
        listener: (context, state) {
          if (state is AddphoneNumberSuccessState) {
            context.pop();
            showToast(
                message: state.message, backgroundColor: AppColor.yellowColor);
          } else if (state is AddPhoneNumberFailureState) {
            showToast(message: state.message);
          }
        },
        builder: (context, state) {
          bool isChange = _user?.user?.contactNumber == null;
          final cubit = context.read<CustomerProfileCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back_ios, color: AppColor.yellowColor)
                        .onTap(context.pop),
                    height(24),
                    Text(
                      isChange
                          ? "AddPhoneNumber".tr()
                          : "ChangePhoneNumber".tr(),
                      style:
                          AppTextStyle.style24.copyWith(color: AppColor.black),
                    ),
                    height(50),
                    FadeAnimationCustom(
                      delay: 1.2,
                      child: CustomTextFormFiled(
                        borderColor: AppColor.yellowColor,
                        controller: cubit.phoneController,
                        hintColor: AppColor.black,
                        textInputColor: AppColor.black,
                        hintText: cubit.userInfo.user?.contactNumber ??
                            "Phone Number",
                        validator: (val) {
                          return AppValidation.phoneNumberVaildtor(
                              cubit.phoneController.text);
                        },
                      ),
                    ),
                    Spacer(),
                    CustomAppButton(
                      text: "Send",
                      containerColor: AppColor.yellowColor,
                      textColor: AppColor.white,
                      onPressed: () {
                        cubit.phoneController.text != _user!.user?.contactNumber
                            ? cubit.phone(_user!)
                            : showToast(
                                message: "Enter a different phone number",
                                backgroundColor: AppColor.redED,
                              );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
