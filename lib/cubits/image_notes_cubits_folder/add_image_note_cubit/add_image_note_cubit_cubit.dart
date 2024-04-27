import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_image_note_cubit_state.dart';

class AddImageNoteCubitCubit extends Cubit<AddImageNoteCubitState> {
  AddImageNoteCubitCubit() : super(AddImageNoteCubitInitial());
}
