import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/core/cache/user_info_cache.dart';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:dream_home/core/utils/fade_animation_custom.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/login_model.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_cubit.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_state.dart';
import 'package:dream_home/feature/customer_home/presentation/data/models/worker_data_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/styles/app_text_style.dart';
import '../widgets/custom_customer_row_header.dart';
import '../widgets/custom_grid_view_item_builder.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
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
    log("$user");
    log("${user?.user?.firstName}");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerHomeCubit(getIt()),
      child: BlocBuilder<CustomerHomeCubit, CustomerHomeState>(
        builder: (context, state) {
          return Scaffold(
              body: FadeAnimationCustom(
            delay: 1.2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  CustomCustomerRowHeader(
                    name: _user?.user?.firstName ?? "",
                  ),
                  height(6),
                  CarouselSlider(
                    items: [
                      Image.asset(
                        AppImages.banner1,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                      Image.asset(
                        AppImages.banner2,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                      Image.asset(
                        AppImages.banner3,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ],
                    options: CarouselOptions(
                      height: 150,
                      aspectRatio: 5 / 1,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  height(16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "ChooseService".tr(),
                        style: AppTextStyle.style20.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  height(16),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      padding: EdgeInsets.only(bottom: 8, top: 4),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return FadeAnimationCustom(
                          delay: 2,
                          child: CustomGridViewItemBuilder(
                            jobName: worker[index].jobName,
                            vectors: worker[index].image,
                            onTap: () => context.pushNamed(
                              Routes.workerCategory,
                              extra: worker[index].jobNameEn.toLowerCase(),
                            ),
                          ),
                        );
                      },
                      itemCount: worker.length,
                    ),
                  ))
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
