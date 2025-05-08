import 'package:bloc/bloc.dart';
import 'package:real_project/features/auth/presentation/bloc/reset_password/reset_password_state.dart';
import 'package:real_project/features/auth/presentation/bloc/auth_event.dart';
import '../../../domain/repositories/auth_repository.dart';

class ResetPasswordBloc extends Bloc<ResetPassEvent, ResetPasswordState> {
  final AuthRepository repository;

  ResetPasswordBloc({required this.repository})
    : super(ResetPasswordInitial()) {
    on<ResetPassEvent>(resetPassword);
  }

  Future<void> resetPassword(
    ResetPassEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(ResetPasswordLoading());

    try {
      final response = await repository.resetPassword(email: event.email);
      emit(ResetPasswordLoaded(resetPassword: response));
    } catch (e) {
      emit(ResetPasswordError(error: e.toString()));
    }
  }
}
