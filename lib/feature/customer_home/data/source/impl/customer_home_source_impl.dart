import 'package:dream_home/core/constant/end_points.dart';
import 'package:dream_home/core/network/dio/base_dio.dart';

import '../base/customer_home_source.dart';

class CustomerHomeSourceImpl implements CustomerHomeSource {
  final BaseDio _dio;

  CustomerHomeSourceImpl(this._dio);
  @override
  Future<Map<String, dynamic>> getWorker({required String category}) async {
    try {
      final response = await _dio.get(EndPoints.getWorker, queryParameters: {
        "service": category,
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
