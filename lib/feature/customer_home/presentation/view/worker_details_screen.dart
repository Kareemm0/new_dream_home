import 'dart:developer';

import 'package:dream_home/Core/extension/extension.dart';
import 'package:dream_home/Core/styles/app_text_style.dart';
import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:dream_home/core/widget/custom_app_button.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/login_model.dart';
import 'package:dream_home/feature/chat/presentation/cubit/chat_cubit.dart';
import 'package:dream_home/feature/customer_home/data/model/WorkerModel/get_worker_model/employee.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_cubit.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_state.dart';
import 'package:dream_home/feature/notifications/presentation/cubit/notification_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/cache/user_info_cache.dart';
import '../../../../core/utils/app_color.dart';
import '../../../customer_profile/presentation/widget/custom_add_profile_stack.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WorkerDetailsScreen extends StatefulWidget {
  final Employee user;
  const WorkerDetailsScreen({super.key, required this.user});

  @override
  State<WorkerDetailsScreen> createState() => _WorkerDetailsScreenState();
}

class _WorkerDetailsScreenState extends State<WorkerDetailsScreen> {
  LoginModel? _user;
  @override
  void initState() {
    load();
    super.initState();
  }

  Future<void> load() async {
    LoginModel? user = await getUserFromSharedPreferences();
    setState(() {
      _user = user;
    });
    log("$_user");
    log("${_user!.user?.firstName}");
    log("Employer Data${widget.user}");
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChatCubit(getIt())
            ..getReview(employeeId: widget.user.id.toString()),
        ),
      ],
      child: BlocProvider(
        create: (context) => CustomerHomeCubit(getIt()),
        child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 40, bottom: 100),
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Icon(Icons.arrow_back_ios,
                                color: AppColor.yellowColor)
                            .onTap(context.pop),
                      ),
                      height(16),
                      CustomAddProfileStack(
                        containerColor: AppColor.yellowColor,
                        borderColor: AppColor.greyD,
                        iconColor: AppColor.black,
                        iconBorderColor: AppColor.transparent,
                        personIcon: Image.asset(AppImages.craft2),
                      ),
                      height(16),
                      Text(
                        widget.user.firstName ?? "",
                        style: AppTextStyle.style18.copyWith(
                          color: AppColor.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      height(8),
                      Text(
                        widget.user.contactNumber ?? "01000000000",
                        style: AppTextStyle.style18.copyWith(
                          color: AppColor.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      height(8),
                      Text(
                        widget.user.job ?? "",
                        style: AppTextStyle.style18.copyWith(
                          color: AppColor.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      height(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColor.yellowColor,
                          ),
                          Text(
                            widget.user.rate.toString(),
                            style: AppTextStyle.style18.copyWith(
                              color: AppColor.black,
                            ),
                          ),
                        ],
                      ),
                      height(8),
                      Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.call,
                            color: AppColor.yellowColor,
                          ),
                          Text(
                            "Call_us".tr(),
                            style: AppTextStyle.style18.copyWith(
                              color: AppColor.black,
                            ),
                          ),
                        ],
                      ).onTap(() {
                        context.push(Routes.chatDetails, extra: {
                          "senderId": _user?.user?.id.toString(),
                          "receiverId": widget.user.id.toString(),
                          "receiverName": widget.user.firstName,
                          "userType": widget.user.role,
                        });
                      }),
                      BlocBuilder<ChatCubit, ChatState>(
                        builder: (context, state) {
                          final cubit = context.read<ChatCubit>();

                          // Filter out empty reviews
                          final nonEmptyReviews = cubit.getReviewModel
                              .where((review) =>
                                  review.review?.isNotEmpty ?? false)
                              .toList();

                          return SizedBox(
                            height: heightSize(context) * 0.3,
                            child: nonEmptyReviews.isEmpty
                                ? Center(child: Text("No reviews available"))
                                : ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      return Text(
                                        nonEmptyReviews[index].review!,
                                        style: AppTextStyle.style16,
                                      );
                                    },
                                    itemCount: nonEmptyReviews.length,
                                  ),
                          );
                        },
                      ),
                      height(heightSize(context) * 0.1),
                      BlocBuilder<CustomerHomeCubit, CustomerHomeState>(
                        builder: (context, state) {
                          final cubit = context.read<CustomerHomeCubit>();
                          return Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                                autoPlay: true,
                                aspectRatio: 1.0,
                                viewportFraction: 0.9,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: true,
                                enlargeFactor: 0.45,
                              ),
                              items: cubit.images
                                  .map((e) => Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.asset(e)))
                                  .toList(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: AppColor.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: BlocProvider(
                    create: (context) => NotificationCubit(getIt()),
                    child: BlocConsumer<NotificationCubit, NotificationState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        final notificationCubit =
                            context.read<NotificationCubit>();
                        //  final homeCubit = context.read<CustomerHomeCubit>();
                        return CustomAppButton(
                          text: "OrderNow".tr(),
                          containerColor: AppColor.yellowColor,
                          textColor: AppColor.white,
                          onPressed: () {
                            notificationCubit.addNotification(
                              _user?.user?.id ?? "",
                              "${_user?.user?.firstName ?? ""} wants to order from you",
                            );
                            // homeCubit.createOrder(
                            //   customerId: _user?.user?.id ?? "",
                            //   workerId: widget.user.id ?? "",
                            // );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
