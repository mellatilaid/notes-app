import 'package:flutter/material.dart';

class ToDoAlertDialogBody extends StatelessWidget {
  const ToDoAlertDialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add To-Do Item'),
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
          onPressed: () {},
        ),
      ],
    );
  }
}
