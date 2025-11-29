import 'package:equatable/equatable.dart';

import 'notification.dart';

class AddNotification extends Equatable {
  final String? message;
  final Notification? notification;

  const AddNotification({this.message, this.notification});

  factory AddNotification.fromJson(Map<String, dynamic> json) {
    return AddNotification(
      message: json['message'] as String?,
      notification: json['notification'] == null
          ? null
          : Notification.fromJson(json['notification'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'notification': notification?.toJson(),
      };

  @override
  List<Object?> get props => [message, notification];
}
