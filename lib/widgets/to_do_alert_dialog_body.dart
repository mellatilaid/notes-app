import 'package:flutter/material.dart';
import 'package:note_app/widgets/invisible_text_field.dart';

class ToDoAlertDialogBody extends StatefulWidget {
  const ToDoAlertDialogBody({super.key});

  @override
  State<ToDoAlertDialogBody> createState() => _ToDoAlertDialogBodyState();
}

class _ToDoAlertDialogBodyState extends State<ToDoAlertDialogBody> {
  List<String> toDoItems = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _toDoItemController = TextEditingController();
  final FocusNode foucusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _toDoItemController.dispose();
    foucusNode.dispose();
  }

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
                for (int i = 0; i < toDoItems.length; i++)
                  CheckboxListTile(
                    value: false,
                    onChanged: (bool? value) {
                      if (value!) {
                        setState(
                          () {
                            toDoItems.removeAt(i);
                          },
                        );
                      }
                    },
                    title: Text(toDoItems[i]),
                  ),
                TextField(
                  focusNode: foucusNode,
                  controller: _toDoItemController,
                  decoration: const InputDecoration(
                    hintText: 'Enter to-do item',
                  ),
                  textInputAction: TextInputAction.next,
                  onSubmitted: (String value) {
                    setState(
                      () {
                        toDoItems.add(value);
                      },
                    );
                    _toDoItemController.clear();
                    FocusScope.of(context).requestFocus(foucusNode);
                  },
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
            if (foucusNode.hasFocus) {
              FocusScope.of(context).unfocus();
            }

            Navigator.pop(context);

            _toDoItemController.clear();
            toDoItems.clear();
          },
        ),
      ],
    );
  }
}
