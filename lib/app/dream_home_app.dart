import 'package:dream_home/app/routes/app_router.dart';
import 'package:dream_home/core/styles/app_styles.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/Pick_Location/cubit/pick_location_cubit.dart';
import 'package:dream_home/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:dream_home/feature/auth/presentation/cubit/register/register_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../feature/customer_home/presentation/cubit/customer_home_cubit.dart';
import '../feature/customer_profile/presentation/cubit/image_picker/image_picker_cubit.dart';

class DreamHomeApp extends StatelessWidget {
  const DreamHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            lazy: false,
            create: (context) => PickLocationCubit()..getUserLocation()),
        BlocProvider(
          create: (context) => ImagePickerCubit(getIt()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => LoginCubit(getIt()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => RegisterCubit(getIt()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => CustomerHomeCubit(getIt()),
          lazy: false,
        ),
      ],
      child: MaterialApp.router(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: theme(),
      ),
    );
  }
}
