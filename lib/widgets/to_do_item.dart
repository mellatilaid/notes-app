import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/tasks_lists_cubits/edit_tasks_list_cubit/edit_tasks_list_cubit.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/models/tasks_list_model.dart';
import 'package:note_app/views/tasks_list_detail_view.dart';

class ToDoItem extends StatefulWidget {
  final TasksListModel tasksList;
  final int tasksListIndex;
  const ToDoItem(
      {super.key, required this.tasksList, required this.tasksListIndex});

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  final TextEditingController _title = TextEditingController();
  int loopLength = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _title.text = widget.tasksList.title ?? '';
    loopLength =
        _setLoopLength(taskListLength: widget.tasksList.tasksList.length);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.toView(TasksListDetailView(
          tasksList: widget.tasksList,
        ));
        //give EditTasksListCubit the tasks list index
        //that it can get it from hive later
        BlocProvider.of<EditTasksListCubit>(context).tasksListIndex =
            widget.tasksListIndex;
      },
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title.text.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(left: 20, top: 8),
                    child: Text(
                      widget.tasksList.title ?? '',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )
                : const SizedBox(),
            for (int i = 0; i < loopLength; i++)
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: widget.tasksList.tasksList[i].isChecked,
                onChanged: null,
                title: Text(widget.tasksList.tasksList[i].title),
              ),
            _isShowDots(tasksListLength: widget.tasksList.tasksList.length)
                ? const Padding(
                    padding: EdgeInsets.only(left: 24, bottom: 8),
                    child: Text(
                      '...',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  //sets the length of the loop
  //so if the taskslist greate length greater than 2 set length to 2
  //otherways let it as it is
  _setLoopLength({required int taskListLength}) {
    if (taskListLength > 2) {
      return 2;
    } else {
      return taskListLength;
    }
  }

//check tasks list length if greater than 2 returns true to show dots
//to tell the user there is more tasks
//otherways return false
  bool _isShowDots({required int tasksListLength}) {
    if (tasksListLength > 2) {
      return true;
    } else {
      return false;
    }
  }
}
