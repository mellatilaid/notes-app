import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_states.dart';

import '../helper/const.dart';

class AddNoteOptionsSpeedDial extends StatelessWidget {
  final List<SpeedDialChild> dialChilds;
  const AddNoteOptionsSpeedDial({
    super.key,
    required this.dialChilds,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        return SpeedDial(
          elevation: 10,
          icon: Icons.add,
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          buttonSize: const Size(50, 50),
          spaceBetweenChildren: 8,
          children: dialChilds.map((e) => e).toList(),
        );
      },
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
