import 'package:flutter/material.dart';
import 'package:note_app/helper/slidable_enums.dart';
import 'package:note_app/widgets/notes_view_slidable_note.dart';

class TextNotesListview extends StatefulWidget {
  final NotesCubitSource notesCubitSource;
  final List<dynamic> textNotes;

  const TextNotesListview({
    super.key,
    required this.textNotes,
    required this.notesCubitSource,
  });

  @override
  State<TextNotesListview> createState() => _TextNotesListviewState();
}

class _TextNotesListviewState extends State<TextNotesListview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: widget.textNotes.length,
      itemBuilder: (context, index) {
        return NotesViewSlidableNote(
          widgetLocation: WidgetLocation.textNotesViewBody,
          noteModel: widget.textNotes[index],
          index: index,
        );
      },
    );
  }
}
