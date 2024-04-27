import 'dart:io';

import 'package:flutter/material.dart';
import 'package:note_app/models/image_note_model.dart';

class ImageNoteItem extends StatelessWidget {
  final ImageNoteModel imageNote;

  const ImageNoteItem({
    Key? key,
    required this.imageNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.zero,
      child: SizedBox(
        height: 85,
        child: Row(
          children: <Widget>[
            // Leading Widget
            Container(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(imageNote.imagePath),
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Title Widget
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        imageNote.imageTitle!.isEmpty
                            ? 'Image title'
                            : imageNote.imageTitle!,
                        style: Theme.of(context).textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      imageNote.date,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
