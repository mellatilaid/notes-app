class AddFolderState {}

class InitialState extends AddFolderState {}

class AddFolderLoadingState extends AddFolderState {}

class SucussAddFolderState extends AddFolderState {}

class FailureAddFolderState extends AddFolderState {
  final String errMessage;
  FailureAddFolderState({required this.errMessage});
}
