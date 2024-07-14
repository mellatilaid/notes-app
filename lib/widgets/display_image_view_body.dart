import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/image_notes_cubits_folder/image_notes_cubit/image_notes_cubit_cubit.dart';
import 'package:note_app/helper/date_time_to_%20string.dart';
import 'package:note_app/helper/styles.dart';
import 'package:note_app/models/image_note_model.dart';
import 'package:note_app/widgets/invisible_text_field.dart';

class DisplayImageViewBody extends StatefulWidget {
  final ImageNoteModel imageNote;
  final bool isReadOnly;
  const DisplayImageViewBody({
    Key? key,
    required this.imageNote,
    required this.isReadOnly,
  }) : super(key: key);

  @override
  State<DisplayImageViewBody> createState() => DisplayImageViewBodyState();
}

class DisplayImageViewBodyState extends State<DisplayImageViewBody> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  saveEdit() {
    widget.imageNote.title = _titleController.text;
    widget.imageNote.content = _contentController.text;
    widget.imageNote.date =
        DateTimeToString().dateToString(time: DateTime.now());
    widget.imageNote.save();
    BlocProvider.of<ImageNotesCubit>(context).fetchAllImageNotes();
  }

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.imageNote.title;
    _contentController.text = widget.imageNote.content!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Colors.transparent,
              elevation: 5,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Hero(
                    tag: 'image_note_${widget.imageNote.imagePath}',
                    child: Image.file(
                      File(widget.imageNote.imagePath),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InvisibleTextField(
              readOnly: widget.isReadOnly,
              controller: _titleController,
              textStyle: Styles.textStyle24,
              hintText: 'Title',
            ),
            InvisibleTextField(
              readOnly: widget.isReadOnly,
              controller: _contentController,
              textStyle: Styles.textStyle16,
              hintText: 'Note',
            ),
          ],
        ),
      ),
    );
  }
}
