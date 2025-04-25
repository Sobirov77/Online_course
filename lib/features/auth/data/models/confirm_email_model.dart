// data/models/token_model.dart

import 'package:real_project/features/auth/domain/entities/confirm_email.dart';

class ConfrimEmailModel extends ConfirmEmail {
  ConfrimEmailModel({
    required super.access_token,
    required super.refresh_token,
  });

  factory ConfrimEmailModel.fromJson(Map<String, dynamic> json) {
    return ConfrimEmailModel(
      access_token: json['accessToken'] ?? '',
      refresh_token: json['refreshToken'] ?? '',
    );
  }
}
