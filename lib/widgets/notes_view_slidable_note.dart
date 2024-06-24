import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app/cubits/image_notes_cubits_folder/image_notes_cubit/image_notes_cubit_cubit.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/notes_cubit/notes_cubit.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/voice_notes_cubit/voice_notes_cubit.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/helper/basic_class.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/helper/enums.dart';
import 'package:note_app/helper/local_file_manager.dart';
import 'package:note_app/helper/slidable_enums.dart';
import 'package:note_app/models/image_note_model.dart';
import 'package:note_app/models/voice_note_model.dart';
import 'package:note_app/views/note_pass_code_view.dart';
import 'package:note_app/widgets/image_note_item.dart';
import 'package:share_plus/share_plus.dart';

import '../models/note_model.dart';
import 'custom_note_item.dart';
import 'custom_voice_note_item.dart';

class NotesViewSlidableNote<T> extends StatefulWidget {
  final WidgetLocation widgetLocation;

  const NotesViewSlidableNote({
    super.key,
    required this.noteModel,
    required this.index,
    required this.widgetLocation,
  });
  //we use this widget in deff places
  //so the type of note model is deff
  final T noteModel;

  final int index;

  @override
  State<NotesViewSlidableNote> createState() => _NotesViewSlidableNoteState();
}

class _NotesViewSlidableNoteState<T> extends State<NotesViewSlidableNote> {
  // ignore: prefer_typing_uninitialized_variables
  late BaseCubit notesCubit;
  //this var store the specific note model after
  //conferming the noteModel var type
  // ignore: prefer_typing_uninitialized_variables
  var note;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //inisilze notesCubit var based on the witch tab bar to
    //to use slidable note widget
    switch (widget.widgetLocation) {
      case WidgetLocation.textNotesViewBody:
        notesCubit = context.read<NotesCubit>();
        note = widget.noteModel as NoteModel;
        break;
      case WidgetLocation.voiceNotesViewBody:
        notesCubit = context.read<VoiceNotesCubit>();
        note = widget.noteModel as VoiceNoteModel;
        break;
      case WidgetLocation.imageNotesViewBody:
        notesCubit = context.read<ImageNotesCubit>();
        note = widget.noteModel as ImageNoteModel;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Slidable(
        key: UniqueKey(),
        startActionPane: ActionPane(
            dismissible: DismissiblePane(
              onDismissed: () => _onDismissed(),
            ),
            extentRatio: 0.8,
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => _onSlidableActionTapped(
                  context,
                  widget.index,
                  NoteSlidableAction.delete,
                  note,
                ),
                borderRadius: BorderRadius.circular(8),
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              (note is NoteModel)
                  ? SlidableAction(
                      onPressed: (context) => _onSlidableActionTapped(
                        context,
                        widget.index,
                        NoteSlidableAction.share,
                        note,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      backgroundColor: const Color(0xFF21B7CA),
                      foregroundColor: Colors.white,
                      icon: Icons.share,
                      label: 'Share',
                    )
                  : const SizedBox(),
              SlidableAction(
                onPressed: (context) {
                  context.toView(const NotePassCodeView());
                },
                borderRadius: BorderRadius.circular(8),
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                icon: Icons.lock_outline,
                label: 'Lock',
              ),
            ]),
        child: (widget.widgetLocation == WidgetLocation.textNotesViewBody)
            ? CustomNoteItem(
                editNoteViewOptin: EditNote.editNoteView,
                note: note,
              )
            : (widget.widgetLocation == WidgetLocation.voiceNotesViewBody)
                ? CustomVoiceNoteItem(voiceNote: note)
                : ImageNoteItem(
                    imageNote: note,
                  ),
      ),
    );
  }

  //this fucntion triggred when one of slidable action button
  //tapped (delete, share)
  _onSlidableActionTapped(
      BuildContext context, int index, NoteSlidableAction action, var note) {
    switch (action) {
      case NoteSlidableAction.delete:
        _deleteNote(context, note);
        break;
      case NoteSlidableAction.share:
        _shareNote();
        break;
      default:
    }
  }

  _shareNote() async {
    await Share.share(
        '${widget.noteModel.title} \n\n ${widget.noteModel.content}');
  }

  _deleteNote(BuildContext context, var note) {
    final note = widget.noteModel;

    notesCubit.removeFromList(index: widget.index);
    Timer timer = Timer(const Duration(seconds: 2), () async {
      //if note model was image note model
      //the image should be deleted from app's directory first
      if (note is ImageNoteModel) {
        await LocalFileManager(filePath: note.imagePath).removeFileFromLocal();
      }
      //if note model was voice note model
      //the voice should be deleted from app's directory first
      if (note is VoiceNoteModel) {
        await LocalFileManager(filePath: note.voicePath).removeFileFromLocal();
      }
      note.delete();
    });
    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      content: const Text(
        'Note was deleted',
      ),
      action: SnackBarAction(
        label: 'Undo',
        textColor: kPrimaryColor,
        onPressed: () async {
          timer.cancel();

          notesCubit.addToList(index: widget.index, model: note);
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //this function triggred when the note is dissmissed
  _onDismissed() {
    widget.noteModel.delete();
    notesCubit.removeFromList(index: widget.index);
  }
}
