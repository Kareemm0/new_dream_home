import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/feature/customer_nav_bar/presentation/cubit/customer_nav_bar_cubit.dart';
import 'package:dream_home/feature/customer_nav_bar/presentation/cubit/customer_nav_bar_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerNavBarScreen extends StatelessWidget {
  const CustomerNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerNavBarCubit(),
      child: BlocBuilder<CustomerNavBarCubit, CustomerNavBarState>(
        builder: (context, state) {
          final cubit = CustomerNavBarCubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColor.white,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              selectedItemColor: AppColor.yellowColor,
              unselectedItemColor: AppColor.primaryColor,
              currentIndex: cubit.currentIndex,
              selectedFontSize: 16,
              selectedIconTheme: IconThemeData(size: 30),
              unselectedIconTheme: IconThemeData(size: 24),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "home".tr()),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search".tr()),
                BottomNavigationBarItem(
                  icon: Icon(Icons.wechat_sharp),
                  label: "Chat".tr(),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_3), label: "Profile".tr()),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
