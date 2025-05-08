import '../entities/mentor_response.dart';
import '../repositories/home_repository.dart';

class MentorsUseCase{
  final HomeRepository homeRepository;

  MentorsUseCase( this.homeRepository);

  Future <ResponseMentor>  call({required int limit})async{
    return await homeRepository.mentors(limit: limit);
  }
}