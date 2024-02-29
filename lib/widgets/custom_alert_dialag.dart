import 'package:flutter/material.dart';

import '../models/folder_model.dart';
import 'custom_action_button.dart';
import 'custom_text_button.dart';

class CustomAlertDialag extends StatelessWidget {
  const CustomAlertDialag({
    super.key,
    required this.folder,
  });

  final FolderModel folder;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text(
        'Are you sure, you wanna delete the folder',
        textAlign: TextAlign.center,
      ),
      actions: [
        CustomActionButton(
            title: 'Delete',
            onPressed: () {
              folder.delete();
              Navigator.pop(context);
            },
            backGroundColor: Colors.red),
        CustomTextButton(
          title: 'Cancel',
          onPressed: () {},
        ),
      ],
    );
  }
}
