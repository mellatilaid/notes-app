import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/dlelete_note_cubit/delete_note_cubit.dart';
import 'package:note_app/cubits/dlelete_note_cubit/delete_note_states.dart';
import 'package:note_app/widgets/add_note_options_speed_dial.dart';
import 'package:note_app/widgets/notes_view_body.dart';

class MyNotesView extends StatelessWidget {
  const MyNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteNoteCubit(),
      child: BlocBuilder<DeleteNoteCubit, DeleteNoteState>(
        builder: (context, state) {
          return Scaffold(
            appBar: state.isSelected
                ? AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: state.isSelected
                        ? BackButton(
                            onPressed: () =>
                                BlocProvider.of<DeleteNoteCubit>(context)
                                  ..set(false)
                                  ..selectedNoteIndex = -1,
                          )
                        : null,
                    actions: [
                      IconButton(
                        onPressed: () => _deleteNote(context),
                        icon: const Icon(Icons.delete_outline),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.ios_share_outlined),
                      ),
                    ],
                  )
                : AppBar(
                    backgroundColor: Colors.transparent,
                    centerTitle: true,
                    elevation: 0,
                    title: const Text('My Notes'),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                    ],
                  ),
            drawer: state.isSelected ? null : const Drawer(),
            body: const NotesViewBody(),
            floatingActionButton:
                state.isSelected ? null : const AddNoteOptionsSpeedDial(),
          );
        },
      ),
    );
  }

  _deleteNote(BuildContext context) {
    BlocProvider.of<DeleteNoteCubit>(context)
      ..deleteNote()
      ..set(false);
  }
}
