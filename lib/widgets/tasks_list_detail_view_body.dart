import 'package:flutter/material.dart';
import 'package:note_app/models/to_do_item_model.dart';
import 'package:note_app/widgets/add_task_alert_dialog.dart';
import 'package:note_app/widgets/invisible_text_field.dart';
import 'package:note_app/widgets/tasks_list_view.dart';

import '../models/tasks_list_model.dart';

class TasksListDetailViewBody extends StatefulWidget {
  final TasksListModel tasksList;
  const TasksListDetailViewBody({super.key, required this.tasksList});

  @override
  State<TasksListDetailViewBody> createState() =>
      _TasksListDetailViewBodyState();
}

class _TasksListDetailViewBodyState extends State<TasksListDetailViewBody> {
  final TextEditingController _title = TextEditingController();
  late List<ToDoItemModel> tasks;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title.text = widget.tasksList.title ?? '';
    tasks = widget.tasksList.tasksList;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _title.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InvisibleTextField(
            controller: _title,
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
                    onAddTask: _addTask,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void _addTask(String taskTitle) {
    setState(() {
      tasks.insert(0, ToDoItemModel(title: taskTitle, isChecked: false));
    });
  }
}
