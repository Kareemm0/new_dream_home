import 'package:dream_home/feature/notifications/data/models/AddNotification/add_notification/add_notification.dart';
import 'package:dream_home/feature/notifications/domain/repo/notification_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/GetNotification/get_notification/get_notification/get_notification.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo _repo;
  NotificationCubit(this._repo) : super(NotificationInitial());

  GetNotification? notificationList;

  Future<void> getNotifications(String userId) async {
    emit(GetNotificationLoadingState());
    final result = await _repo.getNotifications(userId: userId);
    result.fold(
      (failure) {
        emit(GetNotificationFailureState(failure.message));
      },
      (notification) {
        notificationList = notification;
        emit(GetNotificationSuccessState(notification));
      },
    );
  }

  Future<void> addNotification(
    String userId,
    String message,
  ) async {
    emit(AddNotificationLoadingState());
    final result = await _repo.addNotification(
      userId: userId,
      message: message,
    );
    result.fold(
      (failure) {
        emit(AddNotificationFailureState(failure.message));
      },
      (notification) {
        emit(AddNotificationSuccessState(notification));
      },
    );
  }

  Future<void> deleteNotification(
    String id,
  ) async {
    emit(DeleteNotificationLoadingState());
    final result = await _repo.deleteNotification(id: id);
    result.fold(
      (failure) {
        emit(DeleteNotificationFailureState(failure.message));
      },
      (message) {
        emit(DeleteNotificationSuccessState(message));
      },
    );
  }
}
