import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit_states.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../helper/const.dart';
import '../models/note_model.dart';
import 'colors_list_view.dart';
import 'custom_action_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title, content;
  TextEditingController titleController = TextEditingController(text: '');
  TextEditingController contentController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: titleController,
          hintText: 'Title',
          onSaved: (data) {
            title = data;
          },
        ),
        const SizedBox(
          height: 4,
        ),
        Expanded(
          child: CustomTextField(
            controller: contentController,
            hintText: 'Content',
            isExpand: true,
            onSaved: (data) {
              content = data;
            },
          ),
        ),
        const ColorsListView(),
        BlocBuilder<AddNoteCubit, AddNoteState>(
          builder: (context, state) {
            return CustomActionButton(
              isLoading: state is AddNoteLaoding ? true : false,
              title: 'Save Note',
              onPressed: () {
                NoteModel note = NoteModel(
                  title: titleController.text,
                  content: contentController.text,
                  date: DateTime.now().toString(),
                  color: Colors.amber.value,
                );

                BlocProvider.of<AddNoteCubit>(context).addNote(note: note);
              },
              backGroundColor: kPrimaryColor,
            );
          },
        ),
      ],
    );
  }
}