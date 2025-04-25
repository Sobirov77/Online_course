import 'package:equatable/equatable.dart';
import 'package:real_project/features/auth/domain/entities/confirm_email.dart';

abstract class ConfirmEmailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConfirmEmailInitial extends ConfirmEmailState {}

class ConfirmEmailLoading extends ConfirmEmailState {}

class ConfirmEmailSuccess extends ConfirmEmailState {
  final ConfirmEmail token;

  ConfirmEmailSuccess({required this.token});

  @override
  List<Object?> get props => [token];
}

class ConfirmEmailFailure extends ConfirmEmailState {
  final String error;

  ConfirmEmailFailure({required this.error});

  @override
  List<Object?> get props => [error];
}