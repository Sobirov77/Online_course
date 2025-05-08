import 'package:real_project/features/auth/domain/entities/confirm_email.dart';

import '../repositories/auth_repository.dart';

class ConfirmEmailUseCase {
  final AuthRepository repository;

  ConfirmEmailUseCase(this.repository);

  Future<ConfirmEmail> call({
    required int user_id,
    required int code,
    required bool isResetPassword,
  }) async {
    return await repository.confirmEmail(
      user_id: user_id,
      code: code,
      isResetPassword: isResetPassword,
    );
  }
}
