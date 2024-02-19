import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubits_folder/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';

import '../helper/const.dart';
import 'custom_action_button.dart';
import 'custom_text_field.dart';
import 'edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  final NoteModel note;
  const EditNoteViewBody({super.key, required this.note});

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomTextField(
            controller: titleController,
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: CustomTextField(
              controller: contentController,
              isExpand: true,
            ),
          ),
          EditNoteColorsListView(
            note: widget.note,
          ),
          CustomActionButton(
            title: 'Save Edit',
            onPressed: () {
              _saveEdit();
              Navigator.pop(context);
            },
            backGroundColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }

  _saveEdit() {
    widget.note.title = titleController.text;
    widget.note.content = contentController.text;
    widget.note.save();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }
}
