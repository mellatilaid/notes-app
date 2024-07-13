import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:note_app/widgets/slidable_tasks_list.dart';

import '../models/tasks_list_model.dart';

class ToDoListListView extends StatelessWidget {
  final List<TasksListModel> tasksLists;
  const ToDoListListView({super.key, required this.tasksLists});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        key: UniqueKey(),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemCount: tasksLists.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: SlidableTasksList(
                  tasksListModel: tasksLists[index],
                  index: index,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
