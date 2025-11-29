import 'package:dartz/dartz.dart';
import 'package:dream_home/feature/notifications/data/models/AddNotification/add_notification/add_notification.dart';
import 'package:dream_home/feature/notifications/domain/repo/notification_repo.dart';
import '../../../../core/network/error/failure.dart';
import '../models/GetNotification/get_notification/get_notification/get_notification.dart';
import '../source/base/notification_source.dart';

class NotificationRepoImpl implements NotificationRepo {
  final NotificationSource _notificationSource;

  NotificationRepoImpl(this._notificationSource);
  @override
  Future<Either<Failure, AddNotification>> addNotification(
      {required String userId, required String message}) async {
    try {
      final response = await _notificationSource.addNotification(
          userId: userId, message: message);

      if (response['message'] == null) {
        return Left(ServerFailure(response['message']));
      }
      return Right(AddNotification.fromJson(response));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteNotification(
      {required String id}) async {
    try {
      final response = await _notificationSource.deleteNotification(id: id);
      if (response['message'] == null) {
        return Left(ServerFailure(response['message']));
      }
      return Right(response['message']);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetNotification>> getNotifications(
      {required String userId}) async {
    try {
      final response =
          await _notificationSource.getNotifications(userId: userId);
      if (response['notifications'] == null) {
        return Left(ServerFailure(response['message']));
      }

      return Right(GetNotification.fromJson(response));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
