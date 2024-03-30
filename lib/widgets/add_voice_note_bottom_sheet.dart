import 'package:flutter/material.dart';

class AddVoiceNoteBottomSheet extends StatelessWidget {
  const AddVoiceNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '00:00',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 32,
          ),
          RecordVoiceActions()
        ],
      ),
    );
  }
}

class RecordVoiceActions extends StatelessWidget {
  const RecordVoiceActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.cancel),
        ),
        CircleAvatar(
            radius: 35,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
              iconSize: 50,
            )),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.done),
        ),
      ],
    );
  }
}
