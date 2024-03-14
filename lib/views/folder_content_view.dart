import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folder_subnotes_cubit/fetch_sub_notes_states.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folder_subnotes_cubit/fethc_sub_notes_cubit.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/views/add_sub_note_view.dart';
import 'package:note_app/widgets/add_note_options_speed_dial.dart';

import '../widgets/folder_subnotes_body.dart';

class FolderContentView extends StatefulWidget {
  final FolderModel folder;
  final int folderIndex;
  const FolderContentView({
    super.key,
    required this.folder,
    required this.folderIndex,
  });

  @override
  State<FolderContentView> createState() => _FolderContentViewState();
}

class _FolderContentViewState extends State<FolderContentView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SubNotesCubit>(context)
        .fetchSubNotes(index: widget.folderIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.folder.title),
        centerTitle: true,
      ),
      body: BlocBuilder<SubNotesCubit, SubNotesState>(
        builder: (context, state) {
          if (state is InitialState) {
            return const Center(
              child: Text(
                'Add Your Sub Notes',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else if (state is SucussState) {
            return FolderSubNotesBody(
              notes: state.notes,
            );
          } else {
            return const Center(
              child: Text('Oops there was a problem'),
            );
          }
        },
      ),
      floatingActionButton: AddNoteOptionsSpeedDial(
        speedDials: [
          customSpeedDialChild(
            onTap: () => context.toView(
              AddSubNoteView(
                index: widget.folderIndex,
              ),
            ),
            icon: const Icon(Icons.text_fields),
            label: 'Add Text',
          ),
          customSpeedDialChild(
              icon: const Icon(Icons.voice_chat), label: 'Add Voice'),
          customSpeedDialChild(
              icon: const Icon(Icons.image), label: 'Add Image'),
          customSpeedDialChild(
              icon: const Icon(Icons.folder), label: 'Add SubFolder'),
        ],
      ),
    );
  }

  SpeedDialChild customSpeedDialChild(
      {required Icon icon, required String label, VoidCallback? onTap}) {
    return SpeedDialChild(
      child: icon,
      // The background color of the mini FAB
      backgroundColor: Colors.grey.withOpacity(0.6),
      // The foreground color of the mini FAB
      foregroundColor: Colors.white,
      // The label of the mini FAB
      label: label,
      // The action to perform when the mini FAB is tapped
      onTap: onTap,
    );
  }
}
