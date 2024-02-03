import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/note_model.dart';

class CustomNoteItem extends StatelessWidget {
  final NoteModel note;
  final bool isNoteSelected;
  final bool isDefault;
  const CustomNoteItem({
    super.key,
    required this.note,
    this.isNoteSelected = false,
    this.isDefault = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(8),
            border: _setBorderColor(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                  '22/03/2002',
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
      ),
    );
  }

  Border? _setBorderColor() {
    if (isNoteSelected) {
      return Border.all(
        color: Colors.red,
        width: 2,
      );
    } else if (Color(note.color) == Colors.transparent) {
      return Border.all(
        color: Colors.grey,
        width: 2,
      );
    } else {
      return null;
    }
  }
}
