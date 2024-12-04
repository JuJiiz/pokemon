import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:pokemon/core/constants.dart';
import 'package:pokemon/core/services/access_token_service.dart';
import 'package:pokemon/core/services/network/access_token_interceptor.dart';
import 'package:pokemon/core/services/network/logging_interceptor.dart';

final dioProvider = Provider<Dio>(
  (ref) {
    final dio = Dio(
      BaseOptions(
        baseUrl: serverUrl,
      ),
    );

    dio.interceptors
      ..add(
        AccessTokenInterceptor(
          accessTokenService: ref.watch(accessTokenServiceProvider),
        ),
      )
      ..add(
        const LoggingInterceptor(),
      );

    return dio;
  },
);

/// 3rd-party lib
/// ex. Firebase, SharedPreferences, SQFLite, ImagePicker, etc.
