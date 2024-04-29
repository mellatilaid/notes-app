import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/image_notes_cubits_folder/image_notes_cubit/image_notes_cubit_cubit.dart';
import 'package:note_app/models/image_note_model.dart';

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
        automaticallyImplyLeading: false,
        leading: !isReadOnly
            ? IconButton(
                onPressed: () {
                  _onEditSaved();
                },
                icon: const Icon(
                  Icons.done,
                ),
              )
            : const SizedBox(),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isReadOnly = !isReadOnly;
              });
            },
            icon: const Icon(
              Icons.edit,
            ),
          ),
          IconButton(
            onPressed: () {
              _deleteNote();
            },
            icon: const Icon(
              Icons.delete_forever,
            ),
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
