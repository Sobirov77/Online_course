import 'package:real_project/features/auth/domain/entities/confirm_email.dart';

import '../repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  Future<ConfirmEmail> call({required String email,required String password}) async {
    if (email.isEmpty ||
        password.isEmpty) {
      throw Exception('All fields must be non-empty');
    }
    return await authRepository.loginUser(email: email, password: password);
  }
}