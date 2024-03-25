import 'package:flutter/material.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  final NoteModel note;

  const CustomNoteItem({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.toView(
          EditNoteView(
            note: note,
          ),
        );
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
