import 'package:equatable/equatable.dart';

import 'notification.dart';

class GetNotification extends Equatable {
  final List<Notification>? notifications;

  const GetNotification({this.notifications});

  factory GetNotification.fromJson(Map<String, dynamic> json) {
    return GetNotification(
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'notifications': notifications?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [notifications];
}
