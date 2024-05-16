import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/tasks_lists_cubits/edit_tasks_list_cubit/edit_tasks_list_cubit.dart';
import 'package:note_app/widgets/add_task_alert_dialog.dart';
import 'package:note_app/widgets/invisible_text_field.dart';
import 'package:note_app/widgets/tasks_list_view.dart';

import '../models/tasks_list_model.dart';

class TasksListDetailViewBody extends StatefulWidget {
  final TasksListModel tasksList;

  const TasksListDetailViewBody({
    super.key,
    required this.tasksList,
  });

  @override
  State<TasksListDetailViewBody> createState() =>
      _TasksListDetailViewBodyState();
}

class _TasksListDetailViewBodyState extends State<TasksListDetailViewBody> {
  final TextEditingController title = TextEditingController();

  late EditTasksListCubit editTasksListCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title.text = widget.tasksList.title ?? '';

    editTasksListCubit = context.read<EditTasksListCubit>();
  }

  @override
  void dispose() {
    super.dispose();
    title.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditTasksListCubit, EditTasksListState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InvisibleTextField(
                onChanged: (value) {
                  _addNewTitleToEditCubit(editTasksListCubit, value);
                },
                controller: title,
                hintText: 'Title',
                textStyle: Theme.of(context).textTheme.headlineSmall,
              ),
              Expanded(
                  child: BlocBuilder<EditTasksListCubit, EditTasksListState>(
                builder: (context, state) {
                  //if new task added to lacal display new tasks list
                  //else display the old version of tasks list
                  if (state is EditTasksListSuccusState) {
                    return TasksListView(
                      tasks: state.tasks,
                    );
                  } else {
                    return const Center(
                      child: Text('oops there was a problem'),
                    );
                  }
                },
              )),
              IconButton.outlined(
                iconSize: 35,
                icon: const Icon(Icons.add),
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return const AddTaskAlertDialog();
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _addNewTitleToEditCubit(
      EditTasksListCubit editTasksListCubit, String? title) {
    editTasksListCubit.changeTitle(title);
  }
}
