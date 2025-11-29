import 'package:dartz/dartz.dart';
import 'package:dream_home/core/network/error/failure.dart';
import 'package:dream_home/feature/notifications/data/models/AddNotification/add_notification/add_notification.dart';
import '../../data/models/GetNotification/get_notification/get_notification/get_notification.dart';

abstract class NotificationRepo {
  Future<Either<Failure, GetNotification>> getNotifications({
    required String userId,
  });
  Future<Either<Failure, AddNotification>> addNotification({
    required String userId,
    required String message,
  });

  Future<Either<Failure, String>> deleteNotification({
    required String id,
  });
}
