import 'dart:io';

import 'package:flutter/material.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/helper/detect_text_direction.dart';
import 'package:note_app/helper/styles.dart';
import 'package:note_app/models/image_note_model.dart';
import 'package:note_app/views/diplay_image_view.dart';

class ImageNoteItem extends StatelessWidget {
  final ImageNoteModel imageNote;

  const ImageNoteItem({
    Key? key,
    required this.imageNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.toView(DisplayImageView(
        imageNote: imageNote,
      )),
      child: Card(
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
                  child: Hero(
                    tag: 'image_note_${imageNote.imagePath}',
                    child: Image.file(
                      File(imageNote.imagePath),
                      width: 80,
                      fit: BoxFit.cover,
                    ),
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
                        alignment: hasAnyRtl(imageNote.title)
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          imageNote.title.isEmpty
                              ? 'Image title'
                              : imageNote.title,
                          style: Styles.textStyle18,
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
      ),
    );
  }
}
