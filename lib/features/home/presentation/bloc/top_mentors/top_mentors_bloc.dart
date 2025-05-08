import 'package:bloc/bloc.dart';
import 'package:real_project/features/home/presentation/bloc/top_mentors/top_mentors_state.dart';

import '../../../domain/repositories/home_repository.dart';
import '../home_event.dart';
class TopMentorsBloc extends Bloc<HomeEvent, TopMentorsState> {
  final HomeRepository homeRepository;

  TopMentorsBloc(this.homeRepository) : super(TopMentorsInitial()) {
    on<TopMentorsEvent>(topMentors);
  }

  Future<void> topMentors(event, emit) async {
    emit(TopMentorsLoading());
    try {
      final topMentors = await homeRepository.topMentors(limit: event.limit);
      emit(TopMentorsLoaded(mentors: topMentors));
    } catch (e) {
      emit(TopMentorsError(message: e.toString()));
    }
  }
}