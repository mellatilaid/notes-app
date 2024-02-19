class AddFolderCubitState {}

class InitialState extends AddFolderCubitState {}

class AddFolderLoadingState extends AddFolderCubitState {}

class SucussAddFolderState extends AddFolderCubitState {}

class FailureAddFolderState extends AddFolderCubitState {
  final String errMessage;
  FailureAddFolderState({required this.errMessage});
}
