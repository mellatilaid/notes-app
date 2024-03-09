import 'package:flutter/material.dart';

import '../helper/const.dart';
import '../models/note_model.dart';
import 'colors_list_view.dart';
import 'custom_action_button.dart';
import 'custom_text_field.dart';

class AddSubNoteViewBody extends StatefulWidget {
  const AddSubNoteViewBody({super.key});

  @override
  State<AddSubNoteViewBody> createState() => _AddSubNoteViewBodyState();
}

class _AddSubNoteViewBodyState extends State<AddSubNoteViewBody> {
  TextEditingController titleController = TextEditingController(text: '');
  TextEditingController contentController = TextEditingController(text: '');
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: titleController,
          hintText: 'Title',
        ),
        const SizedBox(
          height: 4,
        ),
        Expanded(
          child: CustomTextField(
            controller: contentController,
            hintText: 'Content',
            isExpand: true,
          ),
        ),
        const ColorsListView(),
        CustomActionButton(
          title: 'Save Note',
          onPressed: () {
            _addNote();
          },
          backGroundColor: kPrimaryColor,
        ),
      ],
    );
  }

  String _formatDate({required DateTime time}) {
    final year = time.year.toString();

    final String month = time.month.toString();

    final String day = time.day.toString();

    return '$day/$month/$year';
  }

  _addNote() {
    NoteModel note = NoteModel(
      title: titleController.text,
      content: contentController.text,
      date: _formatDate(time: DateTime.now()),
      color: Colors.amber.value,
    );
  }
}
