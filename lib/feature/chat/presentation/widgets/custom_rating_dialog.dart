import 'dart:developer';

import 'package:dream_home/core/function/show_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/styles/app_text_style.dart';
import '../../../../core/cache/user_info_cache.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widget/custom_app_button.dart';
import '../../../../di.dart';
import '../cubit/chat_cubit.dart';

class CustomRatingDialog extends StatefulWidget {
  const CustomRatingDialog({super.key});

  @override
  State<CustomRatingDialog> createState() => _CustomRatingDialogState();
}

class _CustomRatingDialogState extends State<CustomRatingDialog> {
  String? _reviewId;

  Future<void> load() async {
    String? reviewId = await getReviewId();
    setState(() {
      _reviewId = reviewId;
    });

    log("=================== REVIEW ID $_reviewId");
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(getIt()),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          if (state is UpdateReviewSuccessState) {
            context.pop();
          } else if (state is UpdateReviewFailureState) {
            showToast(message: state.error, backgroundColor: AppColor.redED);
          }
        },
        builder: (context, state) {
          final cubit = context.read<ChatCubit>();
          return Dialog(
            backgroundColor: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColor.white,
              ),
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 16,
                children: [
                  Text(
                    "rateUs".tr(),
                    style: AppTextStyle.style18,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          cubit.selectedRating > index
                              ? Icons.star
                              : Icons.star_border,
                          color: AppColor.yellowColor,
                          size: 36,
                        ),
                        onPressed: () {
                          setState(() {
                            cubit.selectedRating = index + 1;
                          });
                        },
                      );
                    }),
                  ),
                  TextField(
                    controller: cubit.reviewController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "shareYourFeedback".tr(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColor.grey8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColor.primaryColor),
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomAppButton(
                    onPressed: () {
                      cubit.updateReview(
                        reviewId: _reviewId!,
                      );
                    },
                    text: "rateUs".tr(),
                    containerColor: AppColor.yellowColor,
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
