import '../../domain/entities/category_response.dart';
import '../../domain/entities/coruse.dart';
import '../../domain/entities/mentor_response.dart';
import '../../domain/entities/search.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_datasource.dart';
import '../models/courses_response_model.dart';

class HomeRepositoryImpl implements HomeRepository{
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<ResponseMentor> mentors({required int limit})async {
    return await homeRemoteDataSource.mentors(limit: limit);
  }

  @override
  Future<CoursesResponseModel> popularCourses({required int limit})async {
    return await homeRemoteDataSource.popularCourses(limit: limit);
  }

  @override
  Future<ResponseMentor> topMentors({required int limit})async {
    return await homeRemoteDataSource.topMentors(limit: limit);

  }

  @override
  Future<CategoryResponse> getCategories({required int limit}) async{
    return await homeRemoteDataSource.getCategories(limit: limit);
  }

  @override
  Future<Course> getSingleCourses({required int id}) {
    // TODO: implement getSingleCourses
    throw UnimplementedError();
  }

  @override
  Future<SearchResponse> search({required String query}) async{
    return await homeRemoteDataSource.search(query: query);
  }

}