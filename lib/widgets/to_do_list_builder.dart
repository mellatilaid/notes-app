import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/tasks_lists_cubits/fetch_tasks_list_cubit/fetch_tasks_list_cubit.dart';
import 'package:note_app/widgets/empty_widget.dart';
import 'package:note_app/widgets/to_do_list_list_view.dart';

class ToDoListBuilder extends StatelessWidget {
  const ToDoListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchTasksListCubit, FetchTasksListState>(
      builder: (context, state) {
        if (state is FetchTasksListSuccuss) {
          if (state.tasksList.isEmpty) {
            return const EmptyWidget(
                title: 'There is no tasks yet',
                message: 'Creat your first tasks list',
                imagePath: 'assets/task.png');
          }
          return ToDoListListView(
            tasksLists: state.tasksList,
          );
        } else {
          return const Center(
            child: Text('oops there was a problem, try later'),
          );
        }
      },
    );
  }
}
