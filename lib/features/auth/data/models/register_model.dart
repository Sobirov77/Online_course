import 'package:real_project/features/auth/domain/entities/register.dart';

class RegisterModel extends Register {
  RegisterModel({required super.user_id, required super.auth_type});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      user_id: json['user_id'] ?? 0,
      auth_type: json['auth_type']?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {'user_id': user_id, 'auth_type': auth_type};
  }
}
