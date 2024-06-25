class SearchState {}

class SearchInitialState extends SearchState {}

class SearchSecussState extends SearchState {
  final List<dynamic> resualt;
  SearchSecussState({required this.resualt});
}

class SearchFailedState extends SearchState {
  final String errMessage;
  SearchFailedState({required this.errMessage});
}
