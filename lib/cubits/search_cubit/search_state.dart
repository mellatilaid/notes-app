class SearchState {}

class SearchInitialState extends SearchState {}

class SearchSecussState extends SearchState {
  final List<dynamic> resualt;
  SearchSecussState({required this.resualt});
}

class SearchEmptyState extends SearchState {}
