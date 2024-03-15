import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/add_sub_note_cubit/add_sub_note_cubit.dart';
import 'package:note_app/cubits/folders_cubits/add_sub_note_cubit/add_sub_note_states.dart';
import 'package:note_app/widgets/add_sub_note_view_body.dart';

class AddSubNoteView extends StatelessWidget {
  final int index;

  const AddSubNoteView({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddSubNoteCubit, AddSubNoteState>(
      listener: (context, state) {
        if (state is SuccussState) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Add Note'),
        ),
        body: AddSubNoteViewBody(
          index: index,
        ),
      ),
    );
  }
}
