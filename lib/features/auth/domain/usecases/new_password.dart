import '../repositories/auth_repository.dart';

class NewPasswordUseCase{
  final AuthRepository authRepository;

  NewPasswordUseCase({required this.authRepository});

  Future<void> call({ required String newPassword,
    required String token,})async{
    return await authRepository.createNewPassword(newPassword: newPassword, token: token);
  }
}