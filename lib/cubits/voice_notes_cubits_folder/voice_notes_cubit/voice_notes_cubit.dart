import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/voice_notes_cubit/voice_notes_cubit_states.dart';
import 'package:note_app/helper/basic_class.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/voice_note_model.dart';

class VoiceNotesCubit extends Cubit<VoiceNotesState> implements BaseNoteCubit {
  VoiceNotesCubit() : super(VoiceNotesInitialState());
  //this list stors voice notes in reversed order
  //to display them newer one to older one
  List<VoiceNoteModel>? reversedVoiceNotes;
  fetchVoiceNotes() {
    var voiceNotesBox = Hive.box<VoiceNoteModel>(kVoiceNoteBox);
    final List<VoiceNoteModel> voiceNotes = voiceNotesBox.values.toList();

    reversedVoiceNotes = voiceNotes.reversed.toList();
    emit(
      VoiceNotesSuccussState(voiceNotes: reversedVoiceNotes!),
    );
  }

  @override
  addToNotes({required int index, required var note}) {
    reversedVoiceNotes!.insert(index, note);
    emit(VoiceNotesSuccussState(voiceNotes: reversedVoiceNotes!));
  }

  @override
  removeFromNotes({required int index}) {
    reversedVoiceNotes!.removeAt(index);
    emit(VoiceNotesSuccussState(voiceNotes: reversedVoiceNotes!));
  }
}
