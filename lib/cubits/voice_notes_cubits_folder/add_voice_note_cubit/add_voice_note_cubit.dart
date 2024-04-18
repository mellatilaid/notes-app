import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/add_voice_note_cubit/add_vioce_note_cubit_states.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/voice_note_model.dart';

class AddVoiceNoteCubit extends Cubit<AddVoiceNotesState> {
  AddVoiceNoteCubit() : super(InitialState());

  addVoiceNote({required VoiceNoteModel voiceNoteModel}) async {
    emit(AddVoiceNoteLoading());

    try {
      var voiceNoteBox = Hive.box<VoiceNoteModel>(kVoiceNoteBox);
      print('voice note path is ${voiceNoteModel.voicePath}');
      await voiceNoteBox.add(voiceNoteModel);
      emit(AddVoiceNoteSuccuss());
    } catch (e) {
      emit(AddVoiceNoteFailure(errMessage: e.toString()));
    }
  }
}
