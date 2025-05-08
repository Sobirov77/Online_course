import '../entities/category_response.dart';
import '../repositories/home_repository.dart';

class CategoryUseCase {
  HomeRepository homeRepository;

  CategoryUseCase(this.homeRepository);

  Future<CategoryResponse> call({required int limit}) async {
    return await homeRepository.getCategories(limit: limit);
  }
}