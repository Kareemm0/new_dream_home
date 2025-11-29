import 'package:dream_home/Core/extension/extension.dart';
import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/widget/custom_loader.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_cubit.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_state.dart';
import 'package:dream_home/feature/customer_home/presentation/widgets/custom_worker_info_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_color.dart';

class WorkerCaregoryScreen extends StatelessWidget {
  final String category;
  const WorkerCaregoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CustomerHomeCubit(getIt())..getworker(category: category),
      child: Scaffold(
        body: BlocBuilder<CustomerHomeCubit, CustomerHomeState>(
          builder: (context, state) {
            final cubit = context.read<CustomerHomeCubit>();

            if (state is GetWorkersLoadingState) {
              return CustomLoader();
            }

            final recommendedWorkers = cubit.users?.employees?.where((worker) {
              final rating = worker.rate ?? 0;
              return rating > 3.5;
            }).toList();

            final otherWorkers = cubit.users?.employees?.where((worker) {
              final rating = worker.rate ?? 0;
              return rating <= 3.5;
            }).toList();

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_back_ios, color: AppColor.yellowColor)
                      .onTap(context.pop),
                  height(24),
                  Text(
                    "most_popular_category"
                        .tr(namedArgs: {"category": category}),
                    style: AppTextStyle.style22.copyWith(
                      color: AppColor.lightblack,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  height(24),
                  if (recommendedWorkers != null &&
                      recommendedWorkers.isNotEmpty) ...[
                    Text(
                      "recommended".tr(),
                      style: AppTextStyle.style18.copyWith(
                        color: AppColor.yellowColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    height(16),
                    ...List.generate(
                      recommendedWorkers.length,
                      (index) => CustomWorkerInfoContainer(
                        name: recommendedWorkers[index].firstName ?? "",
                        phone: recommendedWorkers[index].contactNumber ??
                            "01000000000",
                        rating: recommendedWorkers[index].rate ?? 0,
                      ).onTap(() {
                        context.pushNamed(Routes.workerdetails,
                            extra: recommendedWorkers[index]);
                      }),
                    ),
                    height(24),
                    Text(
                      "all_workers".tr(),
                      style: AppTextStyle.style18.copyWith(
                        color: AppColor.lightblack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    height(16),
                  ],
                  ...List.generate(
                    otherWorkers?.length ?? 0,
                    (index) => CustomWorkerInfoContainer(
                      name: otherWorkers?[index].firstName ?? "",
                      phone:
                          otherWorkers?[index].contactNumber ?? "01000000000",
                      rating: otherWorkers?[index].rate ?? 0,
                    ).onTap(() {
                      context.pushNamed(Routes.workerdetails,
                          extra: otherWorkers?[index]);
                    }),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
