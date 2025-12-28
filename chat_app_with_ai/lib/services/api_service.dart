// create api service using dio
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(
    String url, {
    Map<String, dynamic>? data,
    headers,
  }) async {
    return await _dio.post(
      url,
      data: data,
      options: Options(headers: headers),
    );
  }
}
