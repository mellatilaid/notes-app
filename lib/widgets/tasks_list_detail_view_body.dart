import 'package:flutter/material.dart';
import 'package:note_app/models/to_do_item_model.dart';
import 'package:note_app/widgets/add_task_alert_dialog.dart';
import 'package:note_app/widgets/invisible_text_field.dart';
import 'package:note_app/widgets/tasks_list_view.dart';

import '../models/tasks_list_model.dart';

class TasksListDetailViewBody extends StatefulWidget {
  final TasksListModel tasksList;
  final Function(List<ToDoItemModel> toDoItems) onSaveChnged;
  final Function(String toDoItemsTitle) onTitleChanged;
  const TasksListDetailViewBody({
    super.key,
    required this.tasksList,
    required this.onSaveChnged,
    required this.onTitleChanged,
  });

  @override
  State<TasksListDetailViewBody> createState() =>
      _TasksListDetailViewBodyState();
}

class _TasksListDetailViewBodyState extends State<TasksListDetailViewBody> {
  final TextEditingController title = TextEditingController();
  late List<ToDoItemModel> tasks;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title.text = widget.tasksList.title ?? '';
    tasks = widget.tasksList.tasksList;
  }

  @override
  void dispose() {
    //callback to save changes to hive
    //when this disposed
    widget.onTitleChanged(title.text);
    super.dispose();
    title.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InvisibleTextField(
            controller: title,
            hintText: 'Title',
            textStyle: Theme.of(context).textTheme.headlineSmall,
          ),
          Expanded(
              child: TasksListView(
            tasks: tasks,
          )),
          IconButton.outlined(
            iconSize: 35,
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AddTaskAlertDialog(
                    tasks: tasks,
                    title: title.text,
                    onAddTask: _addTask,
                    onSaveChnged: widget.onSaveChnged,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

//added the new task to tasks to display it immiedetly
//without saving it to hive
  void _addTask(String taskTitle) {
    setState(() {
      tasks.insert(0, ToDoItemModel(title: taskTitle, isChecked: false));
    });
  }
}
