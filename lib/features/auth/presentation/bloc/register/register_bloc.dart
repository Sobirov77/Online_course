import 'package:bloc/bloc.dart';
import 'package:real_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:real_project/features/auth/presentation/bloc/register/register_event.dart';
import 'package:real_project/features/auth/presentation/bloc/register/register_state.dart';

class RegisterBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  RegisterBloc({required this.repository}) : super(AuthInitial()) {
    on<RegisterEvent>(register);
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final response = await repository.doRegister(
        email: event.email,
        password: event.password,
      );
      emit(AuthLoaded(register: response));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }
}
