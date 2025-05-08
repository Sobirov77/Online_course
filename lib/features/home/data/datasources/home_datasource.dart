import '../../domain/entities/search.dart';
import '../models/category_response_model.dart';
import '../models/courses_response_model.dart';
import '../models/mentor_response_model.dart';

abstract class HomeRemoteDataSource {
  //   MENTORS
  Future<MentorsResponseModel> topMentors({required int limit});

  Future<MentorsResponseModel> mentors({required int limit});

  // COURSES
  Future<CoursesResponseModel> popularCourses({required int limit});

  // Category
  Future<CategoryResponseModel> getCategories({required int limit});

  // Search
  Future<SearchResponse> search({required String query});


}