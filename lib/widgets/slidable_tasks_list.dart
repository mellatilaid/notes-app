import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app/cubits/tasks_lists_cubits/fetch_tasks_list_cubit/fetch_tasks_list_cubit.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/helper/slidable_enums.dart';
import 'package:note_app/models/tasks_list_model.dart';
import 'package:note_app/views/note_pass_code_view.dart';
import 'package:note_app/widgets/to_do_item.dart';

import '../helper/const.dart';

class SlidableTasksList extends StatefulWidget {
  const SlidableTasksList({
    super.key,
    required this.tasksListModel,
    required this.index,
  });

  final TasksListModel tasksListModel;

  final int index;

  @override
  State<SlidableTasksList> createState() => _SlidableTasksListState();
}

class _SlidableTasksListState extends State<SlidableTasksList> {
  late final FetchTasksListCubit fetchTasksListCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTasksListCubit = context.read<FetchTasksListCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
          dismissible: DismissiblePane(
            onDismissed: () => _onDismissed(),
          ),
          extentRatio: 0.8,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => _onSlidableActionTapped(
                context,
                widget.index,
                NoteSlidableAction.delete,
                widget.tasksListModel,
              ),
              borderRadius: BorderRadius.circular(8),
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context) => _onSlidableActionTapped(
                context,
                widget.index,
                NoteSlidableAction.share,
                widget.tasksListModel,
              ),
              borderRadius: BorderRadius.circular(8),
              backgroundColor: const Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.share,
              label: 'Share',
            ),
            SlidableAction(
              onPressed: (context) {
                context.toView(const NotePassCodeView());
              },
              borderRadius: BorderRadius.circular(8),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              icon: Icons.lock_outline,
              label: 'Lock',
            ),
          ]),
      child: ToDoItem(
          tasksListIndex: widget.index, tasksList: widget.tasksListModel),
    );
  }

  //this fucntion triggred when one of slidable action button
  //tapped (delete, share)
  _onSlidableActionTapped(BuildContext context, int index,
      NoteSlidableAction action, TasksListModel tasksList) {
    switch (action) {
      case NoteSlidableAction.delete:
        _deleteNote(context, tasksList);
        break;
      case NoteSlidableAction.share:
        _shareNote();
        break;
      default:
    }
  }

  _shareNote() {}

  _deleteNote(BuildContext context, TasksListModel tasksList) {
    final taskList = widget.tasksListModel;

    fetchTasksListCubit.removeFromList(index: widget.index);
    Timer timer = Timer(const Duration(seconds: 2), () async {
      taskList.delete();
    });
    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      content: const Text(
        'TaskList was deleted',
      ),
      action: SnackBarAction(
        label: 'Undo',
        textColor: kPrimaryColor,
        onPressed: () async {
          timer.cancel();

          fetchTasksListCubit.addToList(
            index: widget.index,
            model: taskList,
          );
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //this function triggred when the note is dissmissed
  _onDismissed() {
    widget.tasksListModel.delete();
    fetchTasksListCubit.fetchAllTasksLists();
  }
}
