part of 'notification_cubit.dart';

sealed class NotificationState extends Equatable {
  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}

final class NotificationLoadingState extends NotificationState {}

final class DeleteNotificationLoadingState extends NotificationState {}

final class DeleteNotificationSuccessState extends NotificationState {
  final String message;

  DeleteNotificationSuccessState(this.message);
}

final class DeleteNotificationFailureState extends NotificationState {
  final String message;

  DeleteNotificationFailureState(this.message);
}

final class GetNotificationLoadingState extends NotificationState {}

final class GetNotificationSuccessState extends NotificationState {
  final GetNotification notification;

  GetNotificationSuccessState(this.notification);
}

final class GetNotificationFailureState extends NotificationState {
  final String message;

  GetNotificationFailureState(this.message);
}

final class AddNotificationLoadingState extends NotificationState {}

final class AddNotificationSuccessState extends NotificationState {
  final AddNotification notification;

  AddNotificationSuccessState(this.notification);
  @override
  List<Object> get props => [notification];
}

final class AddNotificationFailureState extends NotificationState {
  final String message;

  AddNotificationFailureState(this.message);
  @override
  List<Object> get props => [message];
}
