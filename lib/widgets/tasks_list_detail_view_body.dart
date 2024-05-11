import 'package:flutter/material.dart';
import 'package:note_app/widgets/invisible_text_field.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title.text = widget.tasksList.title ?? '';
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
            textStyle: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
