import 'package:dream_home/Core/extension/extension.dart';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/utils/fade_animation_custom.dart';
import 'package:dream_home/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/styles/app_text_style.dart';
import '../../../../Core/utils/app_images.dart';
import '../../../../app/routes/routes.dart';
import '../../../../core/function/show_toast.dart';
import '../../../../core/function/validation.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widget/custom_app_button.dart';
import '../cubit/login/login_cubit.dart';
import '../cubit/login/login_state.dart';
import '../widget/custom_auth_text.dart';
import '../widget/custom_text_form_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            showToast(
                message: state.user.message!, backgroundColor: AppColor.green);
            state.user.user?.role == "customer"
                ? context.pushReplacement(Routes.customernavbar)
                : context.pushReplacement(Routes.workernavbar);
          } else if (state is LoginFailureState) {
            showToast(message: state.message, backgroundColor: AppColor.redED);
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: heightSize(context) * 0.3,
                    child: Image.asset(AppImages.logo),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      decoration: BoxDecoration(
                        color: AppColor.yellowColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Form(
                          key: cubit.formKey,
                          child: Column(
                            spacing: 16,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    FadeAnimationCustom(
                                      delay: 1.2,
                                      child: Text("Welcome_Again".tr(),
                                          style: AppTextStyle.style20),
                                    ),
                                    FadeAnimationCustom(
                                      delay: 1.2,
                                      child: Text(
                                        "PleaseLogin".tr(),
                                        style: AppTextStyle.style16
                                            .copyWith(color: AppColor.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FadeAnimationCustom(
                                delay: 1.2,
                                child: CustomTextFormFiled(
                                  borderColor: AppColor.black,
                                  controller: cubit.emailController,
                                  hintText: "EmailHint".tr(),
                                  validator: (value) =>
                                      AppValidation.emailValidator(
                                          cubit.emailController.text),
                                ),
                              ),
                              FadeAnimationCustom(
                                delay: 1.2,
                                child: CustomTextFormFiled(
                                  borderColor: AppColor.black,
                                  controller: cubit.passwordController,
                                  hintText: "passwordHint".tr(),
                                  validator: (value) =>
                                      AppValidation.passwordVaildtor(
                                          cubit.passwordController.text),
                                ),
                              ),
                              FadeAnimationCustom(
                                delay: 1.2,
                                child: Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Text(
                                    "ForgetPassword".tr(),
                                    style: AppTextStyle.style16
                                        .copyWith(color: AppColor.redED),
                                  ).onTap(() {
                                    context.push(Routes.forgetpaswword);
                                  }),
                                ),
                              ),
                              FadeAnimationCustom(
                                delay: 1.2,
                                child: CustomAppButton(
                                  text: "login".tr(),
                                  containerColor: AppColor.white,
                                  textColor: AppColor.black,
                                  onPressed: () {
                                    cubit.login();
                                  },
                                ),
                              ),
                              FadeAnimationCustom(
                                delay: 1.2,
                                child: Center(
                                  child: CustomAuthText(
                                    isLoadgin: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
