import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/tasks_lists_cubits/fetch_tasks_list_cubit/fetch_tasks_list_cubit.dart';
import 'package:note_app/widgets/to_do_list_builder.dart';

class ToDoViewBody extends StatefulWidget {
  const ToDoViewBody({super.key});

  @override
  State<ToDoViewBody> createState() => _ToDoViewBodyState();
}

class _ToDoViewBodyState extends State<ToDoViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FetchTasksListCubit>(context).fetchAllTasksLists();
  }

  @override
  Widget build(BuildContext context) {
    return const ToDoListBuilder();
  }
}
