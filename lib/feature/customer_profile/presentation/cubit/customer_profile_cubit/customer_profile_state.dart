part of 'customer_profile_cubit.dart';

sealed class CustomerProfileState {}

final class CustomerProfileInitial extends CustomerProfileState {}

final class CustomerProfileLoading extends CustomerProfileState {}

final class LogoutSuccessState extends CustomerProfileState {
  final String message;

  LogoutSuccessState(this.message);
}

final class LogoutFailureState extends CustomerProfileState {
  final String message;

  LogoutFailureState(this.message);
}

final class DeleteAccountSuccessState extends CustomerProfileState {
  final String message;

  DeleteAccountSuccessState(this.message);
}

final class DeleteAccountFailureState extends CustomerProfileState {
  final String message;

  DeleteAccountFailureState(this.message);
}

final class AddphoneNumberSuccessState extends CustomerProfileState {
  final String message;

  AddphoneNumberSuccessState(this.message);
}

final class AddPhoneNumberFailureState extends CustomerProfileState {
  final String message;

  AddPhoneNumberFailureState(this.message);
}

final class AddJobSuccessState extends CustomerProfileState {
  final String message;

  AddJobSuccessState(this.message);
}

final class AddJobFailureState extends CustomerProfileState {
  final String message;

  AddJobFailureState(this.message);
}

final class UpdateProfileInfoSuccessState extends CustomerProfileState {
  final User user;

  UpdateProfileInfoSuccessState(this.user);
}

final class UpdateProfileInfoFailureState extends CustomerProfileState {
  final String message;

  UpdateProfileInfoFailureState(this.message);
}

final class UpdateProfileInfoLoadingState extends CustomerProfileState {}

final class GetUserInfoSuccessState extends CustomerProfileState {
  final ProfileInfoModel user;

  GetUserInfoSuccessState(this.user);
}

final class GetUserInfoFailureState extends CustomerProfileState {
  final String message;

  GetUserInfoFailureState(this.message);
}

final class GetUserInfoLoadingState extends CustomerProfileState {}
