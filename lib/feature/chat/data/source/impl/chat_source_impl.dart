import 'package:dream_home/core/constant/end_points.dart';
import 'package:dream_home/core/network/dio/base_dio.dart';
import 'package:dream_home/feature/chat/data/source/base/chat_source.dart';

class ChatSourceImpl implements ChatSource {
  final BaseDio _dio;

  ChatSourceImpl(this._dio);
  @override
  Future<Map<String, dynamic>> getAllChats({required String userid}) async {
    try {
      final response = await _dio.get(EndPoints.getAllChats(userid));

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getChatMessages(
      {required String senderId, required String receiverId}) async {
    try {
      final response = await _dio.post(EndPoints.getChatMessages, data: {
        "senderId": senderId,
        "receiverId": receiverId,
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> sendMessage(
      {required String senderId,
      required String receiverId,
      required String message}) async {
    try {
      final response = await _dio.post(EndPoints.sendMessage, data: {
        "senderId": senderId,
        "receiverId": receiverId,
        "message": message,
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> requestReview(
      {required String employeeId, required String customerId}) async {
    try {
      final response = await _dio.post(
        EndPoints.requestReview,
        data: {
          "employeeId": employeeId,
          "customerId": customerId,
        },
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> updateReview(
      {required String reviewId,
      required String review,
      required int rating}) async {
    try {
      final response = await _dio.put(EndPoints.updateReview, data: {
        "reviewId": reviewId,
        "review": review,
        "rating": rating,
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<dynamic>> getReviews({required String employeeId}) async {
    try {
      final response = await _dio.get(EndPoints.getReviews(employeeId));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
