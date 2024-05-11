import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/models/tasks_list_model.dart';

import 'invisible_text_field.dart';

class ToDoItem extends StatefulWidget {
  final TasksListModel tasksList;
  const ToDoItem({super.key, required this.tasksList});

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
    log(widget.tasksList.title ?? '');
    _title.text = widget.tasksList.title ?? '';
    loopLength =
        _setLoopLength(taskListLength: widget.tasksList.tasksList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title.text.isNotEmpty
              ? InvisibleTextField(
                  controller: _title,
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                )
              : const SizedBox(),
          for (int i = 0; i < loopLength; i++)
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: widget.tasksList.tasksList[i].isChecked,
              onChanged: (bool? value) {
                if (value!) {}
              },
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
