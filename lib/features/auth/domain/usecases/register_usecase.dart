import 'package:real_project/features/auth/domain/repositories/auth_repository.dart';

import '../entities/register.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Register> call({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('All fields should bu non-empty');
    }

    return await repository.doRegister(email: email, password: password);
  }
}
