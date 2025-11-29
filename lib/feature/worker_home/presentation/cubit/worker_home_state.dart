part of 'worker_home_cubit.dart';

sealed class WorkerHomeState {}

final class WorkerHomeInitial extends WorkerHomeState {}

final class WorkerHomeLoadingState extends WorkerHomeState {}

final class WorkerHomeSuccessState extends WorkerHomeState {
  final List<OrderModel> order;

  WorkerHomeSuccessState(this.order);
}

final class WorkerHomeFailureState extends WorkerHomeState {
  final String message;

  WorkerHomeFailureState(this.message);
}

final class ChangeOrderStatusSuccessState extends WorkerHomeState {
  final String message;

  ChangeOrderStatusSuccessState(this.message);
}

final class ChangeOrderStatusFailureState extends WorkerHomeState {
  final String message;

  ChangeOrderStatusFailureState(this.message);
}
