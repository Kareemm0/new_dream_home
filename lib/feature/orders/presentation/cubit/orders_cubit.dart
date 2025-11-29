import 'package:dream_home/feature/customer_home/data/model/order_model.dart';
import 'package:dream_home/feature/worker_home/data/repos/worker_home_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final WorkerHomeRepo _repo;
  OrdersCubit(this._repo) : super(OrdersInitial());

  int currentIndex = 0;

  List<OrderModel> order = [];

  List<String> orderStatus = [
    "Pendding".tr(),
    "Accepted".tr(),
    "Declined".tr(),
  ];

  void changeIndexState(int index) {
    currentIndex = index;
    emit(ChangeIndexState());
    getOrder();
  }

  Future<void> getOrder() async {
    final result = await _repo.getOrder();

    result.fold((failure) {
      emit(GetOrderFailureState(failure.message));
    }, (success) {
      order = success;
      emit(GetOrderSuccessState(success));
    });
  }
}
