import 'package:bloc/bloc.dart';
import 'package:real_project/features/home/presentation/bloc/search/search_state.dart';
import '../../../domain/repositories/home_repository.dart';
import '../home_event.dart';

class SearchBloc extends Bloc<HomeEvent, SearchState> {
  final HomeRepository homeRepository;

  SearchBloc(this.homeRepository) : super(SearchInitial()) {
    on<SearchEvent>(searchCourse);
  }

  Future<void> searchCourse(event, emit) async {
    emit(SearchLoading());
    try {
      final response = await homeRepository.search(query: event.query);
      emit(SearchLoaded(searchResponse: response));
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }
}