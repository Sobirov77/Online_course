import 'package:real_project/features/auth/domain/entities/confirm_email.dart';
import 'package:real_project/features/auth/domain/entities/reset_password.dart';

import '../entities/register.dart';

abstract class AuthRepository {
  Future<Register> doRegister({
    required String email,
    required String password,
  });

  Future<ConfirmEmail> confirmEmail({
    required String user_id,
    required String code,
  });

  Future<ResetPassword> resetPassword({required String email});
}
