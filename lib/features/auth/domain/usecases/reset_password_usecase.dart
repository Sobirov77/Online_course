import 'package:real_project/features/auth/domain/entities/reset_password.dart';

import '../repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<ResetPassword> call({required String email}) async {
    return await repository.resetPassword(email: email);
  }
}
