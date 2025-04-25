import 'package:real_project/features/auth/data/datasources/auth_dataSource.dart';
import 'package:real_project/features/auth/domain/entities/confirm_email.dart';
import 'package:real_project/features/auth/domain/entities/reset_password.dart';
import 'package:real_project/features/auth/domain/repositories/auth_repository.dart';
import '../models/register_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

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
    required String user_id,
    required String code,
  }) {
    return authDataSource.confirmEmail(user_id: user_id, code: code);

  }
}
