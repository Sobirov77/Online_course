import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;

  RegisterEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginWithEmailEvent extends AuthEvent {
  final String email;
  final String password;

  LoginWithEmailEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class ResetPassEvent extends AuthEvent {
  final String email;

  ResetPassEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class ResetNewPasswordEvent extends AuthEvent {
  final String newPassword;
  final String token;

  ResetNewPasswordEvent({required this.newPassword, required this.token});

  @override
  List<Object?> get props => [newPassword, token];
}
