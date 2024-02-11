import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';

class NewFolderDialog extends StatefulWidget {
  const NewFolderDialog({super.key});

  @override
  _NewFolderDialogState createState() => _NewFolderDialogState();
}

class _NewFolderDialogState extends State<NewFolderDialog> {
  // A controller to access the user input
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create a new folder'),
      content: TextFormField(
        controller: _controller,
        decoration: const InputDecoration(
            hintText: 'Enter the folder name',
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: kPrimaryColor,
            ))),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 10,
      actions: [
        TextButton(
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.grey),
          ),
          onPressed: () {
            // Close the dialog
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text(
            'Create',
            style: TextStyle(color: kPrimaryColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
