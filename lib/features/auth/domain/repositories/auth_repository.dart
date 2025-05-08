import 'package:real_project/features/auth/domain/entities/confirm_email.dart';
import 'package:real_project/features/auth/domain/entities/reset_password.dart';

import '../entities/register.dart';

abstract class AuthRepository {
  Future<Register> doRegister({
    required String email,
    required String password,
  });

  Future<ConfirmEmail> confirmEmail({
    required int user_id,
    required int code,
    required bool isResetPassword,
  });

  Future<ResetPassword> resetPassword({required String email});

  Future<void> createNewPassword({required String newPassword, required String token});

  Future<ConfirmEmail> loginUser({required String email, required String password});

  Future<void> logoutUser({required String refreshToken});
}
