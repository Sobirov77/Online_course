import 'package:equatable/equatable.dart';
import 'package:real_project/features/auth/domain/entities/register.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final Register register;

  AuthLoaded({required this.register});

  @override
  List<Object?> get props => [register];
}

class AuthError extends AuthState {
  final String error;

  AuthError({required this.error});

  @override
  List<Object?> get props => [error];
}
