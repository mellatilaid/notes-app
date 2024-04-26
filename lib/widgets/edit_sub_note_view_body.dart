import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/edit_sub_notes_cubit/edit_sub_note_cubit.dart';
import 'package:note_app/widgets/edit_sub_note_colors_list_view.dart';

import '../helper/const.dart';
import '../models/note_model.dart';
import 'custom_action_button.dart';
import 'invisible_text_field.dart';

class EditSubNoteViewBody extends StatefulWidget {
  final NoteModel note;
  const EditSubNoteViewBody({super.key, required this.note});

  @override
  State<EditSubNoteViewBody> createState() => _EditSubNoteViewBodyState();
}

class _EditSubNoteViewBodyState extends State<EditSubNoteViewBody> {
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
          InvisibleTextField(
            controller: titleController,
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: InvisibleTextField(
              controller: contentController,
              isExpand: true,
            ),
          ),
          EditSubNoteColorsListView(note: widget.note),
          CustomActionButton(
            title: 'Save Edit',
            onPressed: () {
              //check if the title and content are empty
              //don't save edit to go back to previes page
              if (titleController.text.isNotEmpty ||
                  contentController.text.isNotEmpty) {
                BlocProvider.of<EditSubNoteCubit>(context).editSubNote(
                  title: titleController.text,
                  content: contentController.text,
                );
              } else {
                Navigator.pop(context);
              }
            },
            backGroundColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
