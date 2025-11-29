import 'dart:developer';
import 'package:dream_home/feature/auth/data/model/Login/login_model/login_model.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/user.dart';
import 'package:dream_home/feature/customer_profile/data/model/profile_info_model/profile_info_model.dart';
import 'package:dream_home/feature/customer_profile/domian/repo/profile_info_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cache/user_info_cache.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../data/repo/logout/logout_repo.dart';
part 'customer_profile_state.dart';

class CustomerProfileCubit extends Cubit<CustomerProfileState> {
  final LogoutRepo logoutRepo;
  final ProfileInfoRepo _repo;
  CustomerProfileCubit(
    this._repo, {
    required this.logoutRepo,
  }) : super(CustomerProfileInitial());

  static CustomerProfileCubit get(context) =>
      BlocProvider.of<CustomerProfileCubit>(context);

  String selectedItem = "";
  String selectedJob = "";
  List<String> items = ["employee", "customer"];
  List<String> images = [AppImages.craft2, AppImages.per2];

  ProfileInfoModel userInfo = ProfileInfoModel();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> logout() async {
    emit(CustomerProfileLoading());
    final result = await logoutRepo.logout();
    result.fold(
      (failure) {
        log("message: ${failure.message}");
        emit(LogoutFailureState(failure.message));
      },
      (message) {
        clearUserData();
        log("message: $message");
        emit(LogoutSuccessState(message));
      },
    );
  }

  Future<void> deleteAccount() async {
    emit(CustomerProfileLoading());
    final result = await logoutRepo.deleteAccount();
    result.fold(
      (failure) {
        log("message: ${failure.message}");
        emit(DeleteAccountFailureState(failure.message));
      },
      (message) {
        clearUserData();
        log("message: $message");
        emit(DeleteAccountSuccessState(message));
      },
    );
  }

  Future<void> phone(LoginModel user) async {
    if (formKey.currentState!.validate()) {
      final result =
          await logoutRepo.phoneNumer(phoneNumer: phoneController.text);

      result.fold((fail) {
        emit(AddPhoneNumberFailureState(fail.message));
      }, (success) async {
        // await saveUserToSharedPreferences(
        //     user, {ShredKeys.phone: phoneController.text});

        emit(AddphoneNumberSuccessState(success));
      });
    }
  }

  List<String> jobs = [
    "Carpentry",
    "Blacksmithing",
    "Plumbing",
    "Electricity",
    "Painting",
    "Tiling ",
    "Carving and Sculpting",
    "Tiling and Flooring Installation",
    "Cooling and Air Conditioning",
    "Electronic Repairs",
    "Home Appliance Maintenance",
    "House Cleaning ",
  ];

  Future<void> job(LoginModel user) async {
    final result = await logoutRepo.job(job: selectedItem);

    result.fold((fail) {
      emit(AddJobFailureState(fail.message));
    }, (success) async {
      // await saveUserToSharedPreferences(user, {
      //   ShredKeys.job: selectedItem,
      // });
      emit(AddJobSuccessState(success));
    });
  }

  Future<void> updateProfileInfo(String userId) async {
    emit(UpdateProfileInfoLoadingState());
    final result = await _repo.updateProfileInfo(
      userId: userId,
      firstName: userNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phone: phoneController.text,
      role: selectedItem,
      job: selectedJob,
    );
    result.fold(
      (failure) {
        log("message: ${failure.message}");
        emit(UpdateProfileInfoFailureState(failure.message));
      },
      (user) async {
        log("message: $user");
        // await saveUserToSharedPreferences(user);
        emit(UpdateProfileInfoSuccessState(user));
      },
    );
  }

  Future<void> getUserInfo(String userId) async {
    emit(CustomerProfileLoading());
    final result = await _repo.getProfileInfo(userId: userId);
    result.fold(
      (failure) {
        log("message: ${failure.message}");
        emit(GetUserInfoFailureState(failure.message));
      },
      (user) {
        userInfo = user;
        log("message: $userInfo");
        emit(GetUserInfoSuccessState(user));
      },
    );
  }
}
