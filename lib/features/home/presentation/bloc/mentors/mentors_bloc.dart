import 'package:bloc/bloc.dart';

import '../../../domain/repositories/home_repository.dart';
import '../home_event.dart';
import 'mentors_state.dart';
class MentorBloc extends Bloc<MentorsEvent, MentorState>{
  final HomeRepository homeRepository;

  MentorBloc(this.homeRepository): super (MentorInitial()){
    on<MentorsEvent>(mentors);
  }

  Future<void> mentors(MentorsEvent event,Emitter<MentorState> emit) async{
    emit(MentorLoading());
    try{
      final mentors = await homeRepository.mentors(limit: event.limit);
      emit(MentorLoaded(mentors: mentors));
    }catch(e){
      emit(MentorError(message: e.toString()));
    }
  }
}