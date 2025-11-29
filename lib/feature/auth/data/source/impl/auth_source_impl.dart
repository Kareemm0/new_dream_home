import 'package:dream_home/core/constant/end_points.dart';
import 'package:dream_home/core/network/dio/base_dio.dart';
import 'package:dream_home/feature/auth/data/source/base/auth_source.dart';

class AuthSourceImpl implements AuthSource {
  final BaseDio _dio;

  AuthSourceImpl(this._dio);
  @override
  Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    try {
      final response = await _dio.post(EndPoints.login, data: {
        "email": email,
        "password": password,
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phone,
      required String type,
      required String job}) async {
    try {
      final response = await _dio.post(EndPoints.register, data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "role": type,
        "contactNumber": phone,
        "job": job
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
