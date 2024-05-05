import 'package:flutter/material.dart';
import 'package:note_app/widgets/invisible_text_field.dart';

class ToDoAlertDialogBody extends StatefulWidget {
  const ToDoAlertDialogBody({super.key});

  @override
  State<ToDoAlertDialogBody> createState() => _ToDoAlertDialogBodyState();
}

class _ToDoAlertDialogBodyState extends State<ToDoAlertDialogBody> {
  final TextEditingController _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: InvisibleTextField(
        controller: _titleController,
        hintText: 'To do list title',
        textStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 2; i++)
                  CheckboxListTile(
                    value: false,
                    onChanged: (bool? value) {
                      if (value!) {
                        setState(
                          () {},
                        );
                      }
                    },
                    title: const Text('laid'),
                  ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Enter to-do item',
                  ),
                  textInputAction: TextInputAction.next,
                  onSubmitted: (String value) {},
                )
              ],
            ),
          );
        },
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
