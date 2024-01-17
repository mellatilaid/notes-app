import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
      children: [
        SpeedDialChild(
          child: const Icon(Icons.text_fields),
          // The background color of the mini FAB
          backgroundColor: Colors.grey.withOpacity(0.6),
          // The foreground color of the mini FAB
          foregroundColor: Colors.white,
          // The label of the mini FAB
          label: 'Add text',
          // The action to perform when the mini FAB is tapped
          onTap: () {
            // Add your logic for adding text here
          },
        ),
      ],
    );
  }
}
