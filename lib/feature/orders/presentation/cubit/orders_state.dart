part of 'orders_cubit.dart';

sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class ChangeIndexState extends OrdersState {}

final class GetOrderSuccessState extends OrdersState {
  final List<OrderModel> order;

  GetOrderSuccessState(this.order);
}

final class GetOrderFailureState extends OrdersState {
  final String message;

  GetOrderFailureState(this.message);
}
