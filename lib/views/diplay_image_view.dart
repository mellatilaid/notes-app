import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/image_notes_cubits_folder/image_notes_cubit/image_notes_cubit_cubit.dart';
import 'package:note_app/models/image_note_model.dart';
import 'package:note_app/widgets/app_bar_icon_button.dart';

import '../helper/local_file_manager.dart';
import '../widgets/display_image_view_body.dart';

class DisplayImageView extends StatefulWidget {
  final ImageNoteModel imageNote;
  const DisplayImageView({
    super.key,
    required this.imageNote,
  });

  @override
  State<DisplayImageView> createState() => _DisplayImageViewState();
}

class _DisplayImageViewState extends State<DisplayImageView> {
  bool isReadOnly = true;
  final GlobalKey<DisplayImageViewBodyState> displayImageVoiceBodyStateKey =
      GlobalKey();

  //when save icon cicked
  //then call saveEdit method of voice player view body
  _onEditSaved() {
    if (displayImageVoiceBodyStateKey.currentState != null &&
        displayImageVoiceBodyStateKey.currentState!.mounted) {
      displayImageVoiceBodyStateKey.currentState!.saveEdit();
      setState(() {
        isReadOnly = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: !isReadOnly
            ? AppBarIconButton(
                onPressed: () {
                  _onEditSaved();
                },
                icon: Icons.done,
              )
            : const SizedBox(),
        actions: [
          AppBarIconButton(
            onPressed: () {
              setState(() {
                isReadOnly = !isReadOnly;
              });
            },
            icon: Icons.edit,
          ),
          AppBarIconButton(
            onPressed: () {
              _deleteNote();
            },
            icon: Icons.delete_outline,
          ),
        ],
      ),
      body: DisplayImageViewBody(
        key: displayImageVoiceBodyStateKey,
        imageNote: widget.imageNote,
        isReadOnly: isReadOnly,
      ),
    );
  }

  _deleteNote() async {
    Navigator.pop(context);
    await LocalFileManager(filePath: widget.imageNote.imagePath)
        .removeFileFromLocal();
    widget.imageNote.delete();
    if (!mounted) return;
    BlocProvider.of<ImageNotesCubit>(context).fetchAllImageNotes();
  }
}
