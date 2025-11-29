import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/worker_profile_repo.dart';

part 'worker_profile_state.dart';

class WorkerProfileCubit extends Cubit<WorkerProfileState> {
  final WorkerProfileRepo _repo;
  WorkerProfileCubit(this._repo) : super(WorkerProfileCubitDartInitial());

  Future<void> logout() async {
    emit(WorkerProfileLoadingState());
    final result = await _repo.logout();
    result.fold(
      (failure) {
        log("message: ${failure.message}");
        emit(LogoutFailureState(failure.message));
      },
      (message) {
        log("message: $message");
        emit(LogoutSuccessState(message));
      },
    );
  }

  Future<void> deleteAccount() async {
    emit(WorkerProfileLoadingState());
    final result = await _repo.deleteAccount();
    result.fold(
      (failure) {
        log("message: ${failure.message}");
        emit(DeleteAccountFailureState(failure.message));
      },
      (message) {
        log("message: $message");
        emit(DeleteAccountSuccessState(message));
      },
    );
  }
}
