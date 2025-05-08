import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/auth_repository.dart';
import '../auth_event.dart';
import 'new_password_state.dart';


class NewPasswordBloc extends Bloc<AuthEvent, ResetNewPasswordState> {
  final AuthRepository authRepository;

  NewPasswordBloc(this.authRepository) : super(ResetNewPasswordInitial()) {
    on<ResetNewPasswordEvent>((event, emit) async {
      emit(ResetNewPasswordLoading());
      try {
        await authRepository.createNewPassword(
          newPassword: event.newPassword,
          token: event.token,
        );
        emit(ResetNewPasswordSuccess());
      } catch (e) {
        emit(ResetNewPasswordError(message: e.toString()));
      }
    });
  }
}