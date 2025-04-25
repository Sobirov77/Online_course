import 'package:equatable/equatable.dart';
import 'package:real_project/features/auth/domain/entities/reset_password.dart';

abstract class ResetPasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordLoaded extends ResetPasswordState {
  final ResetPassword resetPassword;

  ResetPasswordLoaded({required this.resetPassword});

  @override
  List<Object> get props => [resetPassword];
}

class ResetPasswordError extends ResetPasswordState {
  final String error;

  ResetPasswordError({required this.error});

  @override
  List<Object> get props => [error];
}
