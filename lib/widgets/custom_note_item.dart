import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/note_model.dart';

class CustomNoteItem extends StatelessWidget {
  final NoteModel note;
  const CustomNoteItem({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(top: 4, bottom: 8, left: 16),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  note.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              trailing: IconButton(
                padding: const EdgeInsets.only(right: 8),
                onPressed: () {
                  note.delete();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 8),
              child: Text(
                '22/03/2002',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6), fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
