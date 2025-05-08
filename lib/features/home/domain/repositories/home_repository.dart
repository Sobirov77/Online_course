import '../entities/category_response.dart';
import '../entities/coruse.dart';
import '../entities/course_response.dart';
import '../entities/mentor_response.dart';
import '../entities/search.dart';

abstract class HomeRepository {
  Future<ResponseMentor> topMentors({required int limit});

  Future<ResponseMentor> mentors({required int limit});

  Future<CourseResponse> popularCourses({required int limit});

  Future<Course> getSingleCourses({required int id});

  Future<CategoryResponse> getCategories({required int limit});

  Future<SearchResponse> search({required String query});
}
