import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:dream_home/core/widget/custom_loader.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/notifications/presentation/cubit/notification_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cache/user_info_cache.dart';
import '../../../../core/function/show_toast.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widget/aimated_loader.dart';
import '../../../auth/data/model/Login/login_model/login_model.dart';
import '../widget/notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  LoginModel? _user;

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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NotificationCubit(getIt())..getNotifications(_user!.user!.id!),
      child: BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {
          if (state is DeleteNotificationSuccessState) {
            showToast(message: state.message, backgroundColor: AppColor.beanut);
            context
                .read<NotificationCubit>()
                .getNotifications(_user?.user?.id ?? "");
          } else if (state is DeleteNotificationFailureState) {
            showToast(message: state.message, backgroundColor: AppColor.redED);
          }
        },
        builder: (context, state) {
          final cubit = context.read<NotificationCubit>();
          if (_user == null) {
            return const Center(child: CustomLoader());
          }
          return Scaffold(
            body: state is GetNotificationLoadingState
                ? CustomLoader()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_back_ios,
                                  color: AppColor.yellowColor)
                              .onTap(context.pop),
                          height(24),
                          Text(
                            "notification".tr(),
                            style: AppTextStyle.style24
                                .copyWith(color: AppColor.lightblack),
                          ),
                          height(24),
                          cubit.notificationList?.notifications == null
                              ? SizedBox(
                                  height: heightSize(context) * 0.6,
                                  child: AnimatedLoader(
                                    animation: AppImages.emptyList,
                                  ),
                                )
                              : Column(
                                  children: [
                                    ...List.generate(
                                      cubit.notificationList?.notifications
                                              ?.length ??
                                          0,
                                      (index) => Dismissible(
                                          background: Container(
                                            margin: EdgeInsets.only(bottom: 16),
                                            decoration: BoxDecoration(
                                              color: AppColor.redED,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          key: UniqueKey(),
                                          onDismissed: (direction) {
                                            cubit.deleteNotification(cubit
                                                    .notificationList
                                                    ?.notifications?[index]
                                                    .id ??
                                                "");
                                          },
                                          child: NotificationItem(
                                            color: AppColor.yellowColor,
                                            // body:
                                            //     cubit.notificationList[index].notification?.message ?? "",
                                            title: cubit
                                                    .notificationList
                                                    ?.notifications?[index]
                                                    .message ??
                                                "",
                                          )),
                                    )
                                  ],
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
