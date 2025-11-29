import 'package:dio/dio.dart';
import 'package:dream_home/feature/auth/data/repo/forgetpassword/forget_password_repo.dart';
import 'package:dream_home/feature/auth/data/repo/login/login_repo_impl.dart';
import 'package:dream_home/feature/auth/data/source/base/auth_source.dart';
import 'package:dream_home/feature/auth/data/source/impl/auth_source_impl.dart';
import 'package:dream_home/feature/auth/domin/repo/auth_repo.dart';
import 'package:dream_home/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:dream_home/feature/auth/presentation/cubit/register/register_cubit.dart';
import 'package:dream_home/feature/chat/data/repo/chat_repo_impl.dart';
import 'package:dream_home/feature/chat/data/source/base/chat_source.dart';
import 'package:dream_home/feature/chat/domin/repo/chat_repo.dart';
import 'package:dream_home/feature/chat/presentation/cubit/chat_cubit.dart';
import 'package:dream_home/feature/customer_home/domain/repo/customer_home_repo.dart';
import 'package:dream_home/feature/customer_home/data/repo/customer_home_repo_impl.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_cubit.dart';
import 'package:dream_home/feature/customer_profile/data/repo/image_picker/image_picker_repo.dart';
import 'package:dream_home/feature/customer_profile/data/repo/image_picker/image_picker_repo_impl.dart';
import 'package:dream_home/feature/customer_profile/data/repo/logout/logout_repo.dart';
import 'package:dream_home/feature/customer_profile/data/repo/logout/logout_repo_impl.dart';
import 'package:dream_home/feature/customer_profile/data/source/base/profile_info_source.dart';
import 'package:dream_home/feature/customer_profile/domian/repo/profile_info_repo.dart';
import 'package:dream_home/feature/customer_profile/presentation/cubit/customer_profile_cubit/customer_profile_cubit.dart';
import 'package:dream_home/feature/customer_profile/presentation/cubit/image_picker/image_picker_cubit.dart';
import 'package:dream_home/feature/notifications/domain/repo/notification_repo.dart';
import 'package:dream_home/feature/orders/presentation/cubit/orders_cubit.dart';
import 'package:dream_home/feature/worker_home/data/repos/worker_home_repo.dart';
import 'package:dream_home/feature/worker_home/data/repos/worker_home_repo_impl.dart';
import 'package:dream_home/feature/worker_home/presentation/cubit/worker_home_cubit.dart';
import 'package:dream_home/feature/worker_profile/data/repos/worker_profile_repo.dart';
import 'package:dream_home/feature/worker_profile/data/repos/worker_profile_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constant/end_points.dart';
import 'core/network/dio/base_dio.dart';
import 'core/network/dio/dio_client.dart';
import 'core/network/dio/dio_interceptor.dart';
import 'feature/auth/data/repo/forgetpassword/forget_password_repo_impl.dart';
import 'feature/auth/presentation/cubit/forget_passowrd/forget_password_cubit.dart';
import 'feature/chat/data/source/impl/chat_source_impl.dart';
import 'feature/customer_home/data/source/base/customer_home_source.dart';
import 'feature/customer_home/data/source/impl/customer_home_source_impl.dart';
import 'feature/customer_profile/data/repo/updateProfileInfo/update_profile_info.dart';
import 'feature/customer_profile/data/source/impl/profile_info_source_impl.dart';
import 'feature/notifications/data/repo/notification_repo_impl.dart';
import 'feature/notifications/data/source/base/notification_source.dart';
import 'feature/notifications/data/source/impl/notification_source_impl.dart';
import 'feature/notifications/presentation/cubit/notification_cubit.dart';

GetIt getIt = GetIt.instance;
SharedPreferences preferences = getIt<SharedPreferences>();
Future<void> initDependencyInjection() async {
  await _registerSingletons();

  _registerSource();
  _registerRepos();
  _registerFactory();
}

Future<void> _registerSingletons() async {
  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(
    () => GlobalKey<NavigatorState>(),
  );
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  BaseOptions options = BaseOptions(
    validateStatus: (status) {
      return status != null && status < 500;
    },
    baseUrl: EndPoints.baseurl,
    followRedirects: false,
    headers: {
      'Content-Type': 'application/json',
    },
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );
  getIt.registerSingleton<BaseDio>(
      DioClient(options: options, dio: Dio(), interceptors: [
    DioInterceptor(),
  ]));
  getIt.registerSingleton<SharedPreferences>(preferences);
}

void _registerSource() {
  getIt.registerSingleton<AuthSource>(AuthSourceImpl(getIt()));
  getIt.registerSingleton<NotificationSource>(NotificationSourceImpl(getIt()));
  getIt.registerSingleton<CustomerHomeSource>(CustomerHomeSourceImpl(getIt()));
  getIt.registerSingleton<ProfileInfoSource>(ProfileInfoSourceImpl(getIt()));
  getIt.registerSingleton<ChatSource>(ChatSourceImpl(getIt()));
}

void _registerRepos() {
  getIt.registerSingleton<AuthRepo>(LoginRepoImpl(getIt()));
  getIt.registerSingleton<ForgetPasswordRepo>(ForgetPasswordRepoImpl());
  getIt.registerSingleton<LogoutRepo>(LogoutRepoImpl());
  getIt.registerSingleton<CustomerHomeRepo>(CustomerHomeRepoImpl(getIt()));
  getIt.registerSingleton<WorkerProfileRepo>(WorkerProfileRepoImpl());
  getIt.registerSingleton<ImagePickerRepo>(ImagePickerRepoImpl());
  getIt.registerSingleton<NotificationRepo>(NotificationRepoImpl(getIt()));
  getIt.registerSingleton<WorkerHomeRepo>(WorkerHomeRepoImpl());
  getIt.registerSingleton<ProfileInfoRepo>(UpdateProfileInfo(getIt()));
  getIt.registerSingleton<ChatRepo>(ChatRepoImpl(getIt()));
}

void _registerFactory() {
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt
      .registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));
  getIt.registerFactory<CustomerProfileCubit>(
      () => CustomerProfileCubit(logoutRepo: getIt(), getIt()));
  getIt.registerFactory<CustomerHomeCubit>(() => CustomerHomeCubit(getIt()));
  getIt.registerFactory<ImagePickerCubit>(() => ImagePickerCubit(getIt()));
  getIt.registerFactory<NotificationCubit>(() => NotificationCubit(getIt()));
  getIt.registerFactory<WorkerHomeCubit>(() => WorkerHomeCubit(getIt()));
  getIt.registerFactory<OrdersCubit>(() => OrdersCubit(getIt()));
  getIt.registerFactory<ChatCubit>(() => ChatCubit(getIt()));
}
