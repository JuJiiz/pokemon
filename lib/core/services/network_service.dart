import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/core/models/app_exceptions.dart';
import 'package:pokemon/core/services/app_module_providers.dart';

final networkServiceProvider = Provider<NetworkService>(
  (ref) => NetworkService(
    dio: ref.watch(dioProvider),
  ),
);

typedef NetworkServiceResponse = Map<String, dynamic>;

class NetworkService {
  static NetworkService? _instance;

  final Dio _dio;

  const NetworkService._(this._dio);

  factory NetworkService({
    required Dio dio,
  }) {
    return _instance ??= NetworkService._(dio);
  }

  Future<NetworkServiceResponse> get({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  }) async {
    return await _request(
      method: 'GET',
      path: path,
      headers: headers,
      queryParams: queryParams,
      body: body,
    );
  }

  Future<NetworkServiceResponse> post({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  }) async {
    return await _request(
      method: 'POST',
      path: path,
      headers: headers,
      queryParams: queryParams,
      body: body,
    );
  }

  Future<NetworkServiceResponse> put({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  }) async {
    return await _request(
      method: 'PUT',
      path: path,
      headers: headers,
      queryParams: queryParams,
      body: body,
    );
  }

  Future<NetworkServiceResponse> patch({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  }) async {
    return await _request(
      method: 'PATCH',
      path: path,
      headers: headers,
      queryParams: queryParams,
      body: body,
    );
  }

  Future<NetworkServiceResponse> delete({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  }) async {
    return await _request(
      method: 'DELETE',
      path: path,
      headers: headers,
      queryParams: queryParams,
      body: body,
    );
  }

  Future<NetworkServiceResponse> _request({
    required String method,
    required String path,
    required Map<String, dynamic>? headers,
    required Map<String, dynamic>? queryParams,
    required Map<String, dynamic>? body,
  }) async {
    final response = await _dio.request(
      path,
      data: body,
      queryParameters: queryParams,
      options: Options(
        method: method,
        headers: headers,
      ),
    );

    final statusCode = response.statusCode;
    final data = response.data;
    if (statusCode == null || statusCode < 200 || statusCode >= 300) {
      throw const MessageException('Request failed');
    } else if (data == null) {
      throw const MessageException('Response is not contain data');
    }
    if (data is Map<String, dynamic>) return data;
    try {
      return jsonDecode(data);
    } catch (e) {
      throw const MessageException('Invalid response data');
    }
  }
}
