import 'dart:developer';

import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/orders/presentation/cubit/orders_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/app_bar.dart';
import '../widget/custom_order_list_view_body.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(getIt())..getOrder(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          final cubit = context.read<OrdersCubit>();
          if (state is GetOrderSuccessState) {
            cubit.order = state.order
                .where((order) =>
                    order.orderStatus == cubit.orderStatus[cubit.currentIndex])
                .toList();
          }

          return Scaffold(
            appBar: appBar(context, title: "Orders".tr()),
            body: Column(
              children: [
                height(24),
                Row(
                  children: [
                    ...List.generate(
                      cubit.orderStatus.length,
                      (index) => Expanded(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: cubit.currentIndex == index
                                ? AppColor.yellowColor.withValues(alpha: 0.3)
                                : AppColor.transparent,
                            border: Border.all(
                              color: cubit.currentIndex == index
                                  ? AppColor.yellowColor
                                  : AppColor.black,
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  cubit.orderStatus[index],
                                  style: AppTextStyle.style18.copyWith(
                                    color: cubit.currentIndex == index
                                        ? AppColor.white
                                        : AppColor.lightblack,
                                  ),
                                ),
                              ),
                            ),
                          ).onTap(() {
                            log(index.toString());
                            cubit.changeIndexState(index);
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
                height(24),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CustomOrderListViewBody(
                        userName: cubit.order[index].userName ?? " ",
                        orderStatus: cubit.order[index].orderStatus ?? " ",
                        phone: cubit.order[index].userphone ?? " ",
                        location: cubit.order[index].userLocation ?? " ",
                      );
                    },
                    itemCount: cubit.order.length,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
