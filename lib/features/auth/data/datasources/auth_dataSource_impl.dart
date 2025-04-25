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
  Future<ConfirmEmail> confirmEmail({
    required String user_id,
    required String code,
  }) async {
    try {
      final response = await dioClient.post(
        ApiUrls.confirmEmail,
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
}
