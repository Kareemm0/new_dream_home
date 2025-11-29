import 'dart:developer';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:dream_home/feature/customer_home/data/model/WorkerModel/get_worker_model/get_worker_model.dart';
import 'package:dream_home/feature/customer_home/domain/repo/customer_home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_home_state.dart';

class CustomerHomeCubit extends Cubit<CustomerHomeState> {
  final CustomerHomeRepo repo;
  CustomerHomeCubit(this.repo) : super(CustomerHomeInitialState());

  static CustomerHomeCubit get(context) =>
      BlocProvider.of<CustomerHomeCubit>(context);

  GetWorkerModel? users;

  Future<void> getworker({
    required String category,
  }) async {
    emit(GetWorkersLoadingState());
    final result = await repo.getWorker(category: category);

    result.fold((failure) {
      emit(GetWorkerFailureState(failure.message));
    }, (success) {
      users = success;

      emit(GetWorkerSuccessState(success));
    });
  }

  List<String> images = [
    AppImages.car,
    AppImages.cle,
    AppImages.cu,
    AppImages.ele,
    AppImages.mai,
    AppImages.pai,
    AppImages.rep,
    AppImages.tec,
    AppImages.ti,
    AppImages.til,
  ];

  Future<void> order({
    required String userName,
    required String userphone,
    required String userLocation,
    required String userId,
    required bool isWorker,
    required String job,
    required String workerName,
    required String workerPhone,
    required String worderId,
    required String workerLocation,
  }) async {
    final result = await repo.order(
      userName: userName,
      userphone: userphone,
      userLocation: userLocation,
      userId: userId,
      orderStatus: "Pendding",
      isWorker: isWorker,
      job: job,
      isOpen: true,
      worderId: worderId,
      workerName: workerName,
      workerPhone: workerPhone,
      workerLocation: workerLocation,
    );

    result.fold((fail) {
      log("Order Failure $fail");
      emit(OrderCreatedFailureState(fail.message));
    }, (success) {
      log("Order Data $success");
      emit(OrderCreatedSuccessfllyState(success));
    });
  }
}
