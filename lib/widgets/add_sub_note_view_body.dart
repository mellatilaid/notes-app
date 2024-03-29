import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/add_sub_note_cubit/add_sub_note_cubit.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folder_subnotes_cubit/fethc_sub_notes_cubit.dart';
import 'package:note_app/widgets/add_sub_note_colors_list_view.dart';

import '../helper/const.dart';
import '../models/note_model.dart';
import 'custom_action_button.dart';
import 'custom_text_field.dart';

class AddSubNoteViewBody extends StatefulWidget {
  const AddSubNoteViewBody({super.key});

  @override
  State<AddSubNoteViewBody> createState() => _AddSubNoteViewBodyState();
}

class _AddSubNoteViewBodyState extends State<AddSubNoteViewBody> {
  final TextEditingController _titleController =
      TextEditingController(text: '');
  final TextEditingController _contentController =
      TextEditingController(text: '');
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: _titleController,
          hintText: 'Title',
        ),
        const SizedBox(
          height: 4,
        ),
        Expanded(
          child: CustomTextField(
            controller: _contentController,
            hintText: 'Content',
            isExpand: true,
          ),
        ),
        const AddSubNoteColorsListView(),
        CustomActionButton(
          title: 'Save Note',
          onPressed: () {
            //if the title and content of note is empty
            //then go back to the previus page
            if (_titleController.text.isEmpty &&
                _contentController.text.isEmpty) {
              Navigator.pop(context);
            }
            NoteModel? note = _addNote();
            if (note != null) {
              BlocProvider.of<AddSubNoteCubit>(context).addSubNote(note: note);
              BlocProvider.of<SubNotesCubit>(context).fetchSubNotes();
            }
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

  NoteModel? _addNote() {
    if (_contentController.text.isNotEmpty ||
        _titleController.text.isNotEmpty) {
      NoteModel note = NoteModel(
        title: _titleController.text,
        content: _contentController.text,
        date: _formatDate(time: DateTime.now()),
        color: kColors[0].value,
      );

      return note;
    }
    return null;
  }
}
