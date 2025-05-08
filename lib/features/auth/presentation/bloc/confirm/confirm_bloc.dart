import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_project/core/network/local_(hive)/hive_database.dart';
import '../../../domain/repositories/auth_repository.dart';
import 'confirm_event.dart';
import 'confirm_state.dart';

class ConfirmEmailBloc extends Bloc<ConfirmEmailEvent, ConfirmEmailState> {
  final AuthRepository repository;
  final AuthLocalDataBase authLocalDataBase;

  ConfirmEmailBloc({required this.repository, required this.authLocalDataBase})
    : super(ConfirmEmailInitial()) {
    on<SendConfirmCodeEvent>(onSendConfirmCode);
  }

  Future<void> onSendConfirmCode(
    SendConfirmCodeEvent event,
    Emitter<ConfirmEmailState> emit,
  ) async {
    emit(ConfirmEmailLoading());

    try {
      final token = await repository.confirmEmail(
        user_id: event.user_id,
        code: event.code,
        isResetPassword: event.isResetPassword,
      );
      emit(ConfirmEmailSuccess(token: token));
    } catch (e) {
      emit(ConfirmEmailFailure(error: e.toString()));
    }
  }
}
