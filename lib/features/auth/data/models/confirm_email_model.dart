// data/models/token_model.dart

import 'package:real_project/features/auth/domain/entities/confirm_email.dart';

class ConfrimEmailModel extends ConfirmEmail {
  ConfrimEmailModel({required super.accessToken, required super.refreshToken});

  factory ConfrimEmailModel.fromJson(Map<String, dynamic> json) {
    return ConfrimEmailModel(
      accessToken: json['access'] ?? '',
      refreshToken: json['refresh'] ?? '',
    );
  }
}
