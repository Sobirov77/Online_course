import '../entities/course_response.dart';
import '../repositories/home_repository.dart';

class CoursesUseCase {
  final HomeRepository homeRepository;

  CoursesUseCase(this.homeRepository);

  Future<CourseResponse> call({required int limit}) async {
    return await homeRepository.popularCourses(limit: limit);
  }
}