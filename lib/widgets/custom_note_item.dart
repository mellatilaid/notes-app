import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/note_model.dart';

class CustomNoteItem extends StatelessWidget {
  final NoteModel note;
  final bool isNoteSelected;
  const CustomNoteItem({
    super.key,
    required this.note,
    this.isNoteSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(top: 4, bottom: 8, left: 16),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
          border: isNoteSelected
              ? Border.all(
                  color: Colors.red,
                  width: 2,
                )
              : null,
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
                style: const TextStyle(
                  fontSize: 16,
                  color: kforeGroundColor,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                '22/03/2002',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
