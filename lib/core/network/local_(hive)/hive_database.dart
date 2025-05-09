import 'package:hive_flutter/adapters.dart';

abstract class AuthLocalDataBase {
  Future<void> saveTokens(String accessToken, String refreshToken);

  String? getAccessToken();

  String? getRefreshToken();

  Future<void> clearTokens();
}

class AuthLocalDataBaseImpl implements AuthLocalDataBase {
  final Box box;

  AuthLocalDataBaseImpl({required this.box});

  @override
  Future<void> clearTokens() async {
    await box.delete('accessToken');
    await box.delete('refreshToken');
  }

  @override
  String? getAccessToken() => box.get('accessToken');

  @override
  String? getRefreshToken() => box.get('refreshToken');

  @override
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await box.put('accessToken', accessToken);
    await box.put('refreshToken', accessToken);
  }
}
