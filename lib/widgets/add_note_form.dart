import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/add_note_cubit/add_note_cubit_states.dart';
import 'package:note_app/helper/assemble_note_helper.dart';

import '../cubits/text_notes_cubits_folder/add_note_cubit/add_note_cubit.dart';
import '../helper/const.dart';
import '../models/note_model.dart';
import 'color_picker.dart';
import 'custom_action_button.dart';
import 'invisible_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  TextEditingController titleController = TextEditingController(text: '');
  TextEditingController contentController = TextEditingController(text: '');
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  void _handleColorSelection(Color color) {
    BlocProvider.of<AddNoteCubit>(context).itemColor = color;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InvisibleTextField(
          controller: titleController,
          hintText: 'Title',
          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 4,
        ),
        Expanded(
          child: InvisibleTextField(
            controller: contentController,
            hintText: 'Content',
            isExpand: true,
          ),
        ),
        ColorPicker(
          onColorSelected: _handleColorSelection,
        ),
        BlocBuilder<AddNoteCubit, AddNoteState>(
          builder: (context, state) {
            return CustomActionButton(
              isLoading: state is AddNoteLaoding ? true : false,
              title: 'Save Note',
              onPressed: () {
                _addNote();
              },
              backGroundColor: kPrimaryColor,
            );
          },
        ),
      ],
    );
  }

  _addNote() {
    NoteModel note = AssembleNote().assembleTextNote(
      title: titleController.text,
      content: contentController.text,
      color: Colors.amber.value,
    );

    BlocProvider.of<AddNoteCubit>(context).addNote(note: note);
  }
}
