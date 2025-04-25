import 'package:real_project/features/auth/domain/entities/confirm_email.dart';

import '../repositories/auth_repository.dart';

class ConfirmEmailUseCase {
  final AuthRepository repository;

  ConfirmEmailUseCase(this.repository);

  Future<ConfirmEmail> call({
    required String user_id,
    required String code,
  }) async {
    if (user_id.isEmpty || code.isEmpty) {
      throw Exception('All fields must be non-empty');
    }
    return await repository.confirmEmail(user_id: user_id, code: code);
  }
}
