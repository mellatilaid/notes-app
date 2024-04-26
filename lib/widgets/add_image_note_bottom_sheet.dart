import 'package:flutter/material.dart';

import 'dual_action_text_field.dart';

class AddImageNoteBottomSheet extends StatelessWidget {
  const AddImageNoteBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AddImageNoteBottomSheetBody();
  }
}

class AddImageNoteBottomSheetBody extends StatefulWidget {
  const AddImageNoteBottomSheetBody({super.key});

  @override
  State<AddImageNoteBottomSheetBody> createState() =>
      _AddImageNoteBottomSheetBodyState();
}

class _AddImageNoteBottomSheetBodyState
    extends State<AddImageNoteBottomSheetBody> {
  final TextEditingController imageNoteTitleController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 350,
            child: Card(
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('assets/text.png'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          DualActionTextField(
            controller: imageNoteTitleController,
            hintText: 'Enter image title',
          ),
          const SizedBox(height: 10),
          TextButton(
            child: const Text('Add Details'),
            onPressed: () {
              // Handle details addition
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text('Add Image Note'),
            onPressed: () {
              // Handle image note addition
            },
          ),
        ],
      ),
    );
  }
}
