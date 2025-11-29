import 'package:dream_home/feature/customer_home/data/model/order_model.dart';
import 'package:dream_home/feature/worker_home/data/repos/worker_home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'worker_home_state.dart';

class WorkerHomeCubit extends Cubit<WorkerHomeState> {
  final WorkerHomeRepo _repo;
  WorkerHomeCubit(this._repo) : super(WorkerHomeInitial());

  List<OrderModel> order = [];
  Future<void> orders() async {
    emit(WorkerHomeLoadingState());
    final result = await _repo.getOrder();

    result.fold((fail) {
      emit(WorkerHomeFailureState(fail.message));
    }, (success) {
      order = success;
      emit(WorkerHomeSuccessState(success));
    });
  }

  Future<void> changeOrderStatus({
    required String orderStatus,
    required String orderId,
  }) async {
    final result = await _repo.changeOrderStatus(
      orderStatus: orderStatus,
      orderId: orderId,
    );

    result.fold((fail) {
      emit(ChangeOrderStatusFailureState(fail.message));
    }, (success) {
      emit(ChangeOrderStatusSuccessState(success));
    });
  }
}
