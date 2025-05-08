import 'package:dio/dio.dart';
import 'package:real_project/core/constants/api_urls.dart';
import 'package:real_project/core/network/dio_client.dart';
import 'package:real_project/features/auth/data/models/reset_password_model.dart';
import 'package:real_project/features/auth/domain/entities/confirm_email.dart';
import '../models/confirm_email_model.dart';
import '../models/register_model.dart';
import 'auth_dataSource.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final DioClient dioClient;

  AuthDataSourceImpl({required this.dioClient});

  @override
  Future<RegisterModel> doRegister({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(
        ApiUrls.register,
        data: {'phone_or_email': email, 'password': password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<ResetPasswordModel> resetPassword({required String email}) async {
    try {
      final response = await dioClient.post(
        ApiUrls.resetPassword,
        data: {'phone_or_email': email},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ResetPasswordModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  String _parseError(Response response) {
    try {
      final errorJson = response.data;
      return errorJson['message'] ?? 'Unknown error occurred';
    } catch (_) {
      return 'Server error: ${response.statusCode}';
    }
  }

  String _parseDioError(DioException e) {
    if (e.response != null && e.response!.data != null) {
      try {
        final errorJson = e.response!.data;
        return errorJson['message'] ?? 'Unknown error occurred';
      } catch (_) {
        return 'Server error: ${e.response?.statusCode}';
      }
    }
    return e.message ?? 'Network error occurred';
  }

  @override
  Future<ConfrimEmailModel> confirmEmail({
    required int user_id,
    required int code,
    required bool isResetPassword,
  }) async {
    try {
      final response = await dioClient.post(
        isResetPassword
            ? ApiUrls.confirmEmail
            : ApiUrls.resetPasswordConfirmCode,
        data: {'user_id': user_id, 'code': code},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ConfrimEmailModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<void> createNewPassword({required String newPassword, required String token}) async {
    try{
      final response = await dioClient.post(ApiUrls.resetPasswordConfirmPassword,
      data: {'password_one': newPassword}
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return print("Password Successfuly Changed");
      }else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e){
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<ConfrimEmailModel> loginUser({required String email, required String password}) async {
    try{
      final response = await dioClient.post(ApiUrls.login,
      data: {'email': email, 'password': password},
      );
      if(response.statusCode == 200 || response.statusCode == 201) {
        return ConfrimEmailModel.fromJson(response.data);
      }
      else{
        throw Exception(_parseError(response));
      }
    }
    on DioException catch (e){
      throw Exception (_parseDioError(e));
    }
  }

  @override
  Future<void> logoutUser({required String refreshToken}) {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }
}
