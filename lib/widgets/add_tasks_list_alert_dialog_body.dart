import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/tasks_lists_cubits/cubit/add_tasks_list_cubit.dart';
import 'package:note_app/helper/show_snak_bar.dart';
import 'package:note_app/helper/tasks_list_organizer.dart';
import 'package:note_app/models/tasks_list_model.dart';
import 'package:note_app/widgets/custom_text_button.dart';
import 'package:note_app/widgets/invisible_text_field.dart';

class AddTasksListAlertDialogBody extends StatefulWidget {
  const AddTasksListAlertDialogBody({super.key});

  @override
  State<AddTasksListAlertDialogBody> createState() =>
      _AddTasksListAlertDialogBodyState();
}

class _AddTasksListAlertDialogBodyState
    extends State<AddTasksListAlertDialogBody> {
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
        hintText: 'Title',
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
                    controlAffinity: ListTileControlAffinity.leading,
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
        CustomTextButton(
          title: 'Close',
          onPressed: () {
            if (foucusNode.hasFocus) {
              FocusScope.of(context).unfocus();
            }

            Navigator.pop(context);

            _toDoItemController.clear();
            toDoItems.clear();
          },
          textColor: Colors.grey,
          width: null,
        ),
        CustomTextButton(
          title: 'Save',
          onPressed: () {
            if (toDoItems.isNotEmpty) {
              final AddTasksListCubit addTasksListCubit =
                  context.read<AddTasksListCubit>();
              _addTasksListToHive(addTasksListCubit: addTasksListCubit);
            } else {
              showSnakBar(context, message: 'add tasks first');
            }
          },
          width: null,
        ),
      ],
    );
  }

  _addTasksListToHive({required AddTasksListCubit addTasksListCubit}) {
    final TasksListModel tasksList = TasksListOrganize().createTasksListModel(
      toDoItems: toDoItems,
      title: _titleController.text,
    );
    addTasksListCubit.addTasksList(tasksListModel: tasksList);
  }
}
