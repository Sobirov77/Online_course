import 'package:real_project/features/auth/data/models/register_model.dart';
import 'package:real_project/features/auth/data/models/reset_password_model.dart';
import 'package:real_project/features/auth/domain/entities/confirm_email.dart';

abstract class AuthDataSource {
  Future<RegisterModel> doRegister({
    required String email,
    required String password,
  });

  Future<ConfirmEmail> confirmEmail({
    required String user_id,
    required String code,
  });


  Future<ResetPasswordModel> resetPassword({
    required String email
  });
}

