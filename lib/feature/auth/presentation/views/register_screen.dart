import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/utils/fade_animation_custom.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/auth/presentation/cubit/register/register_cubit.dart';
import 'package:dream_home/feature/auth/presentation/widget/custom_choose_account_type.dart';
import 'package:dream_home/feature/auth/presentation/widget/custom_choose_your_job.dart';
import 'package:dream_home/feature/customer_home/presentation/data/models/worker_data_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routes/routes.dart';
import '../../../../core/constant/app_sized.dart';
import '../../../../core/function/show_toast.dart';
import '../../../../core/function/validation.dart';
import '../../../../core/widget/custom_app_button.dart';
import '../../../../core/widget/dialogs/dialog.dart';
import '../widget/custom_auth_text.dart';
import '../widget/custom_image_container.dart';
import '../widget/custom_text_form_filed.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt()),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            showToast(
              message: state.user.message!,
              backgroundColor: AppColor.green,
            );

            context.pushReplacement(Routes.login);
          } else if (state is RegisterError) {
            showToast(
              message: state.message,
              backgroundColor: AppColor.redED,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<RegisterCubit>();
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: cubit.formKey,
                      child: Column(
                        spacing: 16,
                        children: [
                          CustomAddImage(),
                          //! User Name
                          FadeAnimationCustom(
                            delay: 1.2,
                            child: CustomTextFormFiled(
                              textInputColor: AppColor.primaryColor,
                              hintColor: AppColor.black,
                              controller: cubit.userNameController,
                              borderColor: AppColor.yellowColor,
                              hintText: "NameHint".tr(),
                              validator: (val) =>
                                  AppValidation.displayNameValidator(
                                cubit.userNameController.text,
                              ),
                            ),
                          ),
                          //! Confirm Password
                          FadeAnimationCustom(
                            delay: 1.2,
                            child: CustomTextFormFiled(
                              textInputColor: AppColor.primaryColor,
                              hintColor: AppColor.black,
                              borderColor: AppColor.yellowColor,
                              controller: cubit.lastNameController,
                              hintText: "lastNameHint".tr(),
                              validator: (val) =>
                                  AppValidation.displayNameValidator(
                                cubit.lastNameController.text,
                              ),
                            ),
                          ),
                          //! Email
                          FadeAnimationCustom(
                            delay: 1.2,
                            child: CustomTextFormFiled(
                              textInputColor: AppColor.primaryColor,
                              hintColor: AppColor.black,
                              controller: cubit.emailController,
                              borderColor: AppColor.yellowColor,
                              hintText: "EmailHint".tr(),
                              validator: (val) => AppValidation.emailValidator(
                                cubit.emailController.text,
                              ),
                            ),
                          ),
                          //! Phone
                          FadeAnimationCustom(
                            delay: 1.2,
                            child: CustomTextFormFiled(
                              textInputColor: AppColor.primaryColor,
                              hintColor: AppColor.black,
                              borderColor: AppColor.yellowColor,
                              controller: cubit.phoneController,
                              hintText: "phoneHint".tr(),
                              validator: (val) =>
                                  AppValidation.phoneNumberVaildtor(
                                cubit.phoneController.text,
                              ),
                            ),
                          ),

                          //! Password
                          FadeAnimationCustom(
                            delay: 1.2,
                            child: CustomTextFormFiled(
                              textInputColor: AppColor.primaryColor,
                              hintColor: AppColor.black,
                              borderColor: AppColor.yellowColor,
                              controller: cubit.passwordController,
                              hintText: "passwordHint".tr(),
                              validator: (val) =>
                                  AppValidation.passwordVaildtor(
                                cubit.passwordController.text,
                              ),
                            ),
                          ),

                          //! Account Type
                          FadeAnimationCustom(
                            delay: 1.2,
                            child: CustomTextFormFiled(
                              hintColor: AppColor.black,
                              controller: TextEditingController(),
                              borderColor: AppColor.yellowColor,
                              hintText: cubit.selectedItem == ""
                                  ? "AccountType".tr()
                                  : cubit.selectedItem,
                              enabled: false,
                            ).onTap(
                              () {
                                popupDropDownDialogs(
                                    context: context,
                                    height: heightSize(context) * 0.25,
                                    children: [
                                      SizedBox(
                                          height: heightSize(context) * 0.25,
                                          width: double.maxFinite,
                                          child: ListView.separated(
                                            separatorBuilder:
                                                (context, index) => Divider(
                                              color: AppColor.yellowColor,
                                              thickness: 3,
                                            ),
                                            itemCount: cubit.items.length,
                                            itemBuilder: (context, index) {
                                              return CustomChooseAccountType(
                                                image: cubit.images[index],
                                                text: cubit.items[index],
                                              ).onTap(() {
                                                setState(() {
                                                  cubit.selectedItem =
                                                      cubit.items[index];
                                                });
                                                context.pop();
                                              });
                                            },
                                          ))
                                    ]);
                              },
                            ),
                          ),
                          //! Job Title
                          Visibility(
                            visible: cubit.selectedItem == "employee",
                            child: FadeAnimationCustom(
                              delay: 1.2,
                              child: CustomTextFormFiled(
                                hintColor: AppColor.black,
                                controller: TextEditingController(),
                                borderColor: AppColor.yellowColor,
                                hintText: cubit.selectedJob == ""
                                    ? "chooseJob".tr()
                                    : cubit.selectedJob,
                                enabled: false,
                              ).onTap(
                                () {
                                  popupDropDownDialogs(
                                      context: context,
                                      height: heightSize(context) * 0.7,
                                      children: [
                                        SizedBox(
                                          height: heightSize(context) * 0.7,
                                          width: double.maxFinite,
                                          child: GridView.builder(
                                            padding: EdgeInsets.only(bottom: 8),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                            ),
                                            itemBuilder: (context, index) {
                                              return CustomChooseYourJob(
                                                image: worker[index].vector,
                                                text: worker[index].jobName,
                                              ).onTap(() {
                                                setState(() {
                                                  cubit.selectedJob =
                                                      worker[index].jobName;
                                                });
                                                context.pop();
                                              });
                                            },
                                            itemCount: worker.length,
                                          ),
                                        )
                                      ]);
                                },
                              ),
                            ),
                          ),
                          FadeAnimationCustom(
                            delay: 1.2,
                            child: CustomAppButton(
                              text: "Sign".tr(),
                              containerColor: AppColor.yellowColor,
                              textColor: AppColor.white,
                              onPressed: () {
                                cubit.register();
                              },
                            ),
                          ),
                          FadeAnimationCustom(
                            delay: 1.2,
                            child: CustomAuthText(
                              isLoadgin: false,
                              textColor: AppColor.yellowColor,
                            ),
                          ),
                        ],
                      ),
                    ),
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
