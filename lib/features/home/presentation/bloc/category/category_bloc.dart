import 'package:bloc/bloc.dart';

import '../../../domain/repositories/home_repository.dart';
import '../home_event.dart';
import 'categoty_state.dart';

class CategoryBloc extends Bloc<HomeEvent, CategoryState> {

  final HomeRepository homeRepository;

  CategoryBloc(this.homeRepository) : super(CategoryInitial()) {
    on<GetCategoriesEvent>(getCategories);
  }
  Future<void> getCategories( event,  emit)async{
    emit(CategoryLoading());
    try{
      final categories =await homeRepository.getCategories(limit: event.limit);
      emit(CategoryLoaded(categories: categories));
    }catch(e){
      emit(CategoryError(message: e.toString()));
    }
  }
}