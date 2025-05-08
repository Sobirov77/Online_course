import 'package:bloc/bloc.dart';
import '../../../domain/repositories/home_repository.dart';
import '../home_event.dart';
import 'courses_state.dart';
class CoursesBloc extends Bloc<HomeEvent, CourseState> {
  final HomeRepository homeRepository;

  CoursesBloc(this.homeRepository) : super(CourseInitial()) {
    on<GetPopularCoursesEvent>(getCourses);
  }

  Future<void> getCourses(event, emit) async {
    emit(CourseLoading());
    try {
      final courses = await homeRepository.popularCourses(limit: event.limit);
      emit(CourseLoaded(courses: courses));
    } catch (e) {
      emit(CourseError(message: e.toString()));
    }
  }
}