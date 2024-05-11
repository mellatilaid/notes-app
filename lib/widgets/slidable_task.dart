import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/helper/slidable_note_enums.dart';
import 'package:note_app/models/tasks_list_model.dart';
import 'package:note_app/views/note_pass_code_view.dart';
import 'package:note_app/widgets/to_do_item.dart';

class SlidableTaskList extends StatefulWidget {
  const SlidableTaskList({
    super.key,
    required this.tasksListModel,
    required this.index,
  });
  //we use this widget in deff places
  //so the type of note model is deff
  final TasksListModel tasksListModel;

  final int index;

  @override
  State<SlidableTaskList> createState() => _SlidableTaskListState();
}

class _SlidableTaskListState extends State<SlidableTaskList> {
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
                  widget.tasksListModel,
                ),
                borderRadius: BorderRadius.circular(8),
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: (context) => _onSlidableActionTapped(
                  context,
                  widget.index,
                  NoteSlidableAction.share,
                  widget.tasksListModel,
                ),
                borderRadius: BorderRadius.circular(8),
                backgroundColor: const Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
              ),
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
        child: ToDoItem(tasksList: widget.tasksListModel),
      ),
    );
  }

  //this fucntion triggred when one of slidable action button
  //tapped (delete, share)
  _onSlidableActionTapped(
      BuildContext context, int index, NoteSlidableAction action, var note) {
    switch (action) {
      case NoteSlidableAction.delete:
        //_deleteNote(context, note);
        break;
      case NoteSlidableAction.share:
        _shareNote();
        break;
      default:
    }
  }

  _shareNote() {}

  /* _deleteNote(BuildContext context, var note) {
    final note = widget.noteModel;

    notesCubit.removeFromNotes(index: widget.index);
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

          notesCubit.addToNotes(index: widget.index, note: note);
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }*/

  //this function triggred when the note is dissmissed
  _onDismissed() {}
}
