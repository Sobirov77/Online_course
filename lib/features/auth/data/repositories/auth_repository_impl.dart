import 'package:real_project/core/network/local_(hive)/hive_database.dart';
import 'package:real_project/features/auth/data/datasources/auth_dataSource.dart';
import 'package:real_project/features/auth/domain/entities/confirm_email.dart';
import 'package:real_project/features/auth/domain/entities/reset_password.dart';
import 'package:real_project/features/auth/domain/repositories/auth_repository.dart';
import '../models/register_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  final AuthLocalDataBase authLocalDataBase;

  AuthRepositoryImpl({required this.authDataSource, required this.authLocalDataBase});

  @override
  Future<RegisterModel> doRegister({
    required String email,
    required String password,
  }) {
    return authDataSource.doRegister(email: email, password: password);
  }

  @override
  Future<ResetPassword> resetPassword({required String email}) {
    return authDataSource.resetPassword(email: email);
  }

  @override
  Future<ConfirmEmail> confirmEmail({
    required int user_id,
    required int code,
    required bool isResetPassword,
  }) async {
    final model = await authDataSource.confirmEmail(
      user_id: user_id,
      code: code,
      isResetPassword: isResetPassword,
    );
    return model;
  }

  @override
  Future<void> logoutUser({required String refreshToken}) {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }
  @override
  String? getAccessToken() => authLocalDataBase.getAccessToken();

  @override
  String? getRefreshToken() => authLocalDataBase.getRefreshToken();

  @override
  Future<void> saveTokens(String accessToken, String refreshToken) {
    return authLocalDataBase.saveTokens(accessToken, refreshToken);
  }

  @override
  Future<void> createNewPassword({required String newPassword, required String token}) {
    return authDataSource.createNewPassword(newPassword: newPassword, token: token);
  }

  @override
  Future<ConfirmEmail> loginUser({required String email, required String password}) {
    return authDataSource.loginUser(email: email, password: password);
  }

}
