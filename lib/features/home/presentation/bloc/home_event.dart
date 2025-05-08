abstract class HomeEvent {
  const HomeEvent();
}

class GetPopularCoursesEvent extends HomeEvent {
  final int limit;

  GetPopularCoursesEvent({required this.limit});
}

class TopMentorsEvent extends HomeEvent {
  final int limit;

  TopMentorsEvent({required this.limit});
}

class MentorsEvent extends HomeEvent {
  final int limit;

  MentorsEvent({required this.limit});
}

class GetCategoriesEvent extends HomeEvent {
  final int limit;

  GetCategoriesEvent({required this.limit});
}

class SearchEvent extends HomeEvent {
  final String query;

  SearchEvent({required this.query});
}