import 'package:flutter/material.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/helper/enums.dart';
import 'package:note_app/helper/set_border.dart';
import 'package:note_app/models/image_note_model.dart';
import 'package:note_app/models/voice_note_model.dart';
import 'package:note_app/views/diplay_image_view.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'package:note_app/views/voice_player_view.dart';

import '../models/note_model.dart';

class SearchResaultItem<T> extends StatefulWidget {
  final T resault;

  final SearchType searchType;
  const SearchResaultItem({
    super.key,
    required this.resault,
    required this.searchType,
  });

  @override
  State<SearchResaultItem> createState() => _SearchResaultItemState();
}

class _SearchResaultItemState<T> extends State<SearchResaultItem> {
  // ignore: prefer_typing_uninitialized_variables
  var resault;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch (widget.searchType) {
      case SearchType.notes:
        resault = widget.resault as NoteModel;
        break;
      case SearchType.voices:
        resault = widget.resault as VoiceNoteModel;
        break;
      case SearchType.images:
        resault = widget.resault as ImageNoteModel;
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          //this handls wictch view to navigate to base on
          //searchType var
          switch (widget.searchType) {
            case SearchType.notes:
              context.toView(EditNoteView(note: resault));
              break;
            case SearchType.images:
              context.toView(DisplayImageView(imageNote: resault));
              break;
            case SearchType.voices:
              context.toView(VoicePlayerView(voiceNote: resault));
              break;
            default:
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: setBorder(color: Colors.transparent.value),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  resault.title,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    /*(Color(resault.color) == Colors.transparent)
                      ? Colors.white
                      : kforeGroundColor,*/
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
