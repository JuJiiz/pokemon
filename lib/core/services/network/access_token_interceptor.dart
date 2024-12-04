import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokemon/core/services/access_token_service.dart';

class AccessTokenInterceptor extends Interceptor {
  final AccessTokenService _accessTokenService;

  const AccessTokenInterceptor({
    required AccessTokenService accessTokenService,
  }) : _accessTokenService = accessTokenService;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _accessTokenService.getAccessToken();
    super.onRequest(
      options.copyWith(
        headers: {
          ...options.headers,
          'Authorization': 'Bearer $accessToken',
        },
      ),
      handler,
    );
  }
}
