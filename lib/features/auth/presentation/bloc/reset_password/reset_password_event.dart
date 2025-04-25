import 'package:equatable/equatable.dart';

class ResetPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResetPassEvent extends ResetPasswordEvent {
  final String email;

  ResetPassEvent({required this.email});

  @override
  List<Object?> get props => [email];
}
