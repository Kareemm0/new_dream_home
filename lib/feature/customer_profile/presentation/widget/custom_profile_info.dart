import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/function/show_toast.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:dream_home/core/utils/fade_animation_custom.dart';
import 'package:dream_home/core/widget/custom_loader.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/login_model.dart';
import 'package:dream_home/feature/auth/presentation/widget/custom_text_form_filed.dart';
import 'package:dream_home/feature/customer_profile/presentation/cubit/customer_profile_cubit/customer_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/cache/user_info_cache.dart';
import '../../../../core/function/validation.dart';
import '../../../../core/widget/dialogs/dialog.dart';
import '../../../auth/presentation/widget/custom_choose_account_type.dart';
import '../../../auth/presentation/widget/custom_choose_your_job.dart';
import '../../../customer_home/presentation/data/models/worker_data_model.dart';
import 'custom_add_profile_stack.dart';

class CustomProfileInfo extends StatefulWidget {
  const CustomProfileInfo({super.key});

  @override
  State<CustomProfileInfo> createState() => _CustomProfileInfoState();
}

class _CustomProfileInfoState extends State<CustomProfileInfo> {
  LoginModel? _user;
  bool _isLoading = true;

  @override
  void initState() {
    load();
    super.initState();
  }

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
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(body: const Center(child: CustomLoader()));
    }

    if (_user == null || _user?.user?.id == null) {
      return Scaffold(body: Center(child: Text("Failed to load user data")));
    }

    return BlocProvider(
      create: (context) => CustomerProfileCubit(logoutRepo: getIt(), getIt())
        ..getUserInfo(_user!.user!.id!),
      child: BlocConsumer<CustomerProfileCubit, CustomerProfileState>(
        listener: (context, state) async {
          if (state is UpdateProfileInfoSuccessState) {
            showToast(
                message: "Profile Updated Successfully",
                backgroundColor: AppColor.green);
            context.read<CustomerProfileCubit>().getUserInfo(_user!.user!.id!);
          } else if (state is UpdateProfileInfoFailureState) {
            showToast(message: state.message, backgroundColor: AppColor.redED);
          }
        },
        builder: (context, state) {
          final cubit = context.read<CustomerProfileCubit>();
          return Scaffold(
            body: state is UpdateProfileInfoLoadingState
                ? const CustomLoader()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 40),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_back_ios,
                                  color: AppColor.yellowColor)
                              .onTap(context.pop),
                          height(24),
                          CustomAddProfileStack(
                            containerColor: AppColor.yellowColor,
                            personIcon: Image.asset(
                              _user?.user?.role == "customer"
                                  ? AppImages.per2
                                  : AppImages.craft2,
                            ),
                            borderColor: AppColor.greyD,
                            iconColor: AppColor.lightblack,
                            iconBorderColor: AppColor.transparent,
                          ),
                          height(30),
                          //! Name
                          FadeAnimationCustom(
                            delay: 1.2,
                            child: CustomTextFormFiled(
                              borderColor: AppColor.yellowColor,
                              textInputColor: AppColor.black,
                              hintText: cubit.userInfo.user?.firstName ?? "",
                              hintColor: AppColor.black,
                              controller: cubit.userNameController,
                              validator: (val) =>
                                  AppValidation.displayNameValidator(
                                      cubit.userNameController.text),
                            ),
                          ),
                          height(16),
                          //! Last Name
                          FadeAnimationCustom(
                            delay: 1.2,
                            child: CustomTextFormFiled(
                              textInputColor: AppColor.black,
                              borderColor: AppColor.yellowColor,
                              hintText: cubit.userInfo.user?.lastName ?? "",
                              hintColor: AppColor.black,
                              controller: cubit.lastNameController,
                              validator: (val) =>
                                  AppValidation.displayNameValidator(
                                      cubit.lastNameController.text),
                            ),
                          ),
                          height(16),
                          //! Email
                          FadeAnimationCustom(
                            delay: 1.2,
                            child: CustomTextFormFiled(
                              textInputColor: AppColor.black,
                              borderColor: AppColor.yellowColor,
                              hintText: cubit.userInfo.user?.email ?? "",
                              hintColor: AppColor.black,
                              controller: cubit.emailController,
                              validator: (val) => AppValidation.emailValidator(
                                  cubit.emailController.text),
                            ),
                          ),
                          height(16),
                          //! Phone Number
                          FadeAnimationCustom(
                            delay: 1.2,
                            child: CustomTextFormFiled(
                              textInputColor: AppColor.black,
                              borderColor: AppColor.yellowColor,
                              hintText:
                                  cubit.userInfo.user?.contactNumber ?? "",
                              hintColor: AppColor.black,
                              controller: cubit.phoneController,
                              validator: (val) =>
                                  AppValidation.phoneNumberVaildtor(
                                      cubit.phoneController.text),
                            ),
                          ),
                          height(16),
                          //! Account Type
                          FadeAnimationCustom(
                            delay: 1.2,
                            child: CustomTextFormFiled(
                              hintColor: AppColor.black,
                              controller: TextEditingController(),
                              borderColor: AppColor.yellowColor,
                              hintText: cubit.selectedItem.isEmpty
                                  ? cubit.userInfo.user?.role ?? "Select role"
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
                                        separatorBuilder: (context, index) =>
                                            Divider(
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
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          height(16),
                          //! Job Title
                          Visibility(
                            visible: cubit.userInfo.user?.role == "employee",
                            child: FadeAnimationCustom(
                              delay: 1.2,
                              child: CustomTextFormFiled(
                                hintColor: AppColor.black,
                                controller: TextEditingController(),
                                borderColor: AppColor.yellowColor,
                                hintText: cubit.selectedJob.isEmpty
                                    ? cubit.userInfo.user?.job ?? "Select job"
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
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                          ),
                                          itemBuilder: (context, index) {
                                            return CustomChooseYourJob(
                                              image: worker[index].image,
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
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          // Uncomment if needed
                          // height(16),
                          // CustomAppButton(
                          //   text: "Update".tr(),
                          //   containerColor: AppColor.yellowColor,
                          //   textColor: AppColor.white,
                          //   onPressed: () {
                          //     cubit.updateProfileInfo(_user?.user?.id ?? "");
                          //   },
                          // )
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
