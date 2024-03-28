import 'package:flutter/material.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'package:note_app/views/edit_sub_note_view.dart';

import '../helper/edit_note_enum.dart';

class CustomNoteItem extends StatelessWidget {
  final NoteModel note;
  final EditNote editNoteViewOptin;
  const CustomNoteItem({
    super.key,
    required this.note,
    required this.editNoteViewOptin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (editNoteViewOptin) {
          case EditNote.editNoteView:
            context.toView(
              EditNoteView(
                note: note,
              ),
            );
            break;
          case EditNote.editSubNoteView:
            context.toView(
              EditSubNoteView(
                note: note,
              ),
            );
          default:
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(8),
          border: _setBorderColor(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                note.title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: (Color(note.color) == Colors.transparent)
                      ? Colors.white
                      : kforeGroundColor,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                note.date,
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: (Color(note.color) == Colors.transparent)
                      ? Colors.white
                      : Colors.black.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Border? _setBorderColor() {
    if (Color(note.color) == Colors.transparent) {
      return Border.all(
        color: Colors.grey,
        width: 2,
      );
    } else {
      return null;
    }
  }
}
