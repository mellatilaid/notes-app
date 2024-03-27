import 'package:flutter/material.dart';

import '../helper/const.dart';
import '../models/note_model.dart';
import 'custom_action_button.dart';
import 'custom_text_field.dart';
import 'edit_note_colors_list_view.dart';

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
              Navigator.pop(context);
            },
            backGroundColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
