import '../entities/mentor_response.dart';
import '../repositories/home_repository.dart';

class TopMentorsUseCase{
  final HomeRepository homeRepository;

  TopMentorsUseCase( this.homeRepository);

  Future <ResponseMentor>  call({required int limit})async{
    return await homeRepository.topMentors(limit: limit);
  }
}