import 'package:dream_home/core/constant/end_points.dart';
import 'package:dream_home/core/network/dio/base_dio.dart';

import '../base/profile_info_source.dart';

class ProfileInfoSourceImpl implements ProfileInfoSource {
  final BaseDio _dio;

  ProfileInfoSourceImpl(this._dio);
  @override
  Future<Map<String, dynamic>> updateProfileInfo(
      {required String userId,
      required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String role,
      String? job}) async {
    try {
      final response = await _dio.post(EndPoints.updateProfile(userId), data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "role": role,
        "contactNumber": phone,
        "job": job
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getProfileInfo({required String userId}) async {
    try {
      final response = await _dio.get(EndPoints.getUserInfo(userId));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
