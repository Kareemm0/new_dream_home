part of 'worker_profile_cubit.dart';

sealed class WorkerProfileState {}

final class WorkerProfileCubitDartInitial extends WorkerProfileState {}

final class WorkerProfileLoadingState extends WorkerProfileState {}

final class DeleteAccountFailureState extends WorkerProfileState {
  final String message;

  DeleteAccountFailureState(this.message);
}

final class DeleteAccountSuccessState extends WorkerProfileState {
  final String message;

  DeleteAccountSuccessState(this.message);
}

final class LogoutFailureState extends WorkerProfileState {
  final String message;

  LogoutFailureState(this.message);
}

final class LogoutSuccessState extends WorkerProfileState {
  final String message;

  LogoutSuccessState(this.message);
}
