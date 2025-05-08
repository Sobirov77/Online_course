import 'package:equatable/equatable.dart';

abstract class ConfirmEmailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SendConfirmCodeEvent extends ConfirmEmailEvent {
  final int user_id;
  final int code;
  final bool isResetPassword;

  SendConfirmCodeEvent({
    required this.user_id,
    required this.code,
    required this.isResetPassword,
  });

  @override
  List<Object?> get props => [user_id, code];
}