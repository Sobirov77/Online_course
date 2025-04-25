import 'package:real_project/features/auth/domain/entities/reset_password.dart';

class ResetPasswordModel extends ResetPassword {
  ResetPasswordModel({required super.user_id, required super.message});

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
      user_id: json['user_id'] ?? 0,
      message: json['message'] ?? "",
    );
  }
  Map<String, dynamic> toJson(){
    return {
    'user_id': user_id,
    'message': message,
    };
    }
}
