import '../entities/search.dart';
import '../repositories/home_repository.dart';

class SearchUseCase {
  final HomeRepository homeRepository;

  SearchUseCase(this.homeRepository);

  Future<SearchResponse> call({required String query}) async {
    return await homeRepository.search(query: query);
  }
}