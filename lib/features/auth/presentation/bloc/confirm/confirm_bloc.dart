import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/auth_repository.dart';
import 'confirm_event.dart';
import 'confirm_state.dart';

class ConfirmEmailBloc extends Bloc<ConfirmEmailEvent, ConfirmEmailState> {
  final AuthRepository repository;

  ConfirmEmailBloc({required this.repository}) : super(ConfirmEmailInitial()) {
    on<SendConfirmCodeEvent>(onSendConfirmCode);
  }

  Future<void> onSendConfirmCode(
    SendConfirmCodeEvent event,
    Emitter<ConfirmEmailState> emit,
  ) async {
    emit(ConfirmEmailLoading());

    try {
      final token = await repository.confirmEmail(
        user_id: event.userId,
        code: event.code,
      );
      emit(ConfirmEmailSuccess(token: token));
    } catch (e) {
      emit(ConfirmEmailFailure(error: e.toString()));
    }
  }
}
