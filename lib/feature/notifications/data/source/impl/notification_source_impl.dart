import 'package:dream_home/core/constant/end_points.dart';
import 'package:dream_home/core/network/dio/base_dio.dart';
import 'package:dream_home/feature/notifications/data/source/base/notification_source.dart';

class NotificationSourceImpl implements NotificationSource {
  final BaseDio _dio;

  NotificationSourceImpl(this._dio);
  @override
  Future<Map<String, dynamic>> addNotification(
      {required String userId, required String message}) async {
    try {
      final response = await _dio.post(EndPoints.addNotification, data: {
        "userId": userId,
        "message": message,
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> deleteNotification({required String id}) async {
    try {
      final response = await _dio.delete(EndPoints.deleteNotification(id));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getNotifications(
      {required String userId}) async {
    try {
      final response = await _dio.get(
        EndPoints.getNotifications(userId),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
