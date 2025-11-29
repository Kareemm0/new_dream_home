import 'package:dream_home/feature/customer_home/data/model/WorkerModel/get_worker_model/get_worker_model.dart';
import 'package:dream_home/feature/customer_home/data/model/order_model.dart';

abstract class CustomerHomeState {}

class CustomerHomeInitialState extends CustomerHomeState {}

class GetWorkersLoadingState extends CustomerHomeState {}

class GetWorkerSuccessState extends CustomerHomeState {
  final GetWorkerModel model;

  GetWorkerSuccessState(this.model);
}

class GetWorkerFailureState extends CustomerHomeState {
  final String message;

  GetWorkerFailureState(this.message);
}

class OrderCreatedSuccessfllyState extends CustomerHomeState {
  final OrderModel order;

  OrderCreatedSuccessfllyState(this.order);
}

class OrderCreatedFailureState extends CustomerHomeState {
  final String message;

  OrderCreatedFailureState(this.message);
}
