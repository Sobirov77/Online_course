import 'package:real_project/features/auth/data/models/confirm_email_model.dart';
import 'package:real_project/features/auth/data/models/register_model.dart';
import 'package:real_project/features/auth/data/models/reset_password_model.dart';

abstract class AuthDataSource {
  Future<RegisterModel> doRegister({
    required String email,
    required String password,
  });

  Future<ConfrimEmailModel> confirmEmail({
    required int user_id,
    required int code,
    required bool isResetPassword,
  });

  Future<ResetPasswordModel> resetPassword({required String email});

  Future<ConfrimEmailModel> loginUser({
    required String email,
    required String password,
});
  Future<void> createNewPassword({
    required String newPassword,
    required String token,
  });

  Future<void> logoutUser({required String refreshToken});
}
