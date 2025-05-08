import 'package:real_project/features/auth/domain/entities/register.dart';

class RegisterModel extends Register {
  RegisterModel({required super.user_id,});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      user_id: json['user_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'user_id': user_id,};
  }
}
