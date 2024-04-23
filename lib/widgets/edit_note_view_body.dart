import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/notes_cubit/notes_cubit.dart';
import 'package:note_app/helper/show_dialag.dart';
import 'package:note_app/models/note_model.dart';

import '../helper/const.dart';
import 'custom_action_button.dart';
import 'custom_text_field.dart';
import 'edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  final NoteModel note;
  final bool isReadOnly;
  const EditNoteViewBody({
    Key? key,
    required this.note,
    required this.isReadOnly,
  }) : super(key: key);

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
            readOnly: widget.isReadOnly,
            controller: titleController,
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: CustomTextField(
              readOnly: widget.isReadOnly,
              controller: contentController,
              isExpand: true,
            ),
          ),
          !widget.isReadOnly
              ? EditNoteColorsListView(
                  note: widget.note,
                )
              : const SizedBox(),
          !widget.isReadOnly
              ? CustomActionButton(
                  title: 'Save Edit',
                  onPressed: () async {
                    await _saveEdit(context);
                  },
                  backGroundColor: kPrimaryColor,
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Future<void> _saveEdit(BuildContext context) async {
    if (_isNoteEmpty()) {
      await showDialogMessage(context, "Empty note can't be saved");
      _resetNoteFields();
    } else {
      await _saveNote();
      if (!mounted) return;
      Navigator.pop(context);
      _updateNotesList(context);
    }
  }

  bool _isNoteEmpty() {
    return titleController.text.isEmpty && contentController.text.isEmpty;
  }

  void _resetNoteFields() {
    titleController.text = widget.note.title;
    contentController.text = widget.note.content;
  }

  Future<void> _saveNote() async {
    widget.note.title = titleController.text;
    widget.note.content = contentController.text;
    await widget.note.save();
  }

  void _updateNotesList(BuildContext context) {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }
}
