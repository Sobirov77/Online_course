import 'package:dio/dio.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../models/category_response_model.dart';
import '../models/courses_response_model.dart';
import '../models/mentor_response_model.dart';
import '../models/search_model.dart';
import 'home_datasource.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  DioClient dioClient = DioClient();

  HomeRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<MentorsResponseModel> mentors({required int limit}) async {
    try {
      final response = await dioClient.get("${ApiUrls.mentors}$limit");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return MentorsResponseModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<CoursesResponseModel> popularCourses({required int limit}) async {
    try {
      final response = await dioClient.get("${ApiUrls.popularCourses}$limit");
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return CoursesResponseModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<MentorsResponseModel> topMentors({required int limit}) async {
    try {
      final response = await dioClient.get("${ApiUrls.topMentors}$limit");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return MentorsResponseModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<CategoryResponseModel> getCategories({required int limit}) async {
    try {
      final response = await dioClient.get("${ApiUrls.categories}$limit");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return CategoryResponseModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<SearchResponseModel> search({required String query}) async {
    try {
      final response = await dioClient.get("${ApiUrls.search}$query");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Calling: ${ApiUrls.search}$query");
        return SearchResponseModel.fromJson(response.data);

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
}