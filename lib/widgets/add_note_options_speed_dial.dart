import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/views/add_notes_view.dart';

import '../helper/const.dart';

class AddNoteOptionsSpeedDial extends StatelessWidget {
  const AddNoteOptionsSpeedDial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      spaceBetweenChildren: 8,
      children: [
        customSpeedDialChild(
            icon: const Icon(Icons.text_fields),
            label: 'Add Text',
            onTap: () {
              context.toView(const AddNotesView());
            }),
        customSpeedDialChild(
          icon: const Icon(Icons.mic),
          label: 'Add Voice',
        ),
        customSpeedDialChild(
          icon: const Icon(Icons.image),
          label: 'Add Image',
        ),
      ],
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
