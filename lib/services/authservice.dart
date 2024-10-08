import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fuzzy/helper/constants.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  Future<Map<String, dynamic>> register(String phone, String password) async {
    try {
      final response = await _dio.post(
        ApiConstants.registerEndpoint,
        data: {'phone': phone, 'password': password},
      );
      return response.data;
    } on DioError catch (e) {
      log('Registration error: ${e.message}');
      throw Exception('Registration failed: ${e.message}');
    }
  }
}
