import 'package:flutter_riverpod/flutter_riverpod.dart';

final accessTokenServiceProvider =
    Provider<AccessTokenService>((ref) => AccessTokenService());

class AccessTokenService {
  static AccessTokenService? _instance;

  const AccessTokenService._();

  factory AccessTokenService() {
    return _instance ??= const AccessTokenService._();
  }

  Future<String?> getAccessToken() async {
    return 'token';
  }

  Future<void> setAccessToken() async {
    //
  }

  Future<String?> getRefreshToken() async {
    return 'token';
  }

  Future<void> setRefreshToken() async {
    //
  }
}
