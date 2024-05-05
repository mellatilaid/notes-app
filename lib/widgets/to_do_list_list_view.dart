import 'package:flutter/material.dart';
import 'package:note_app/widgets/to_do_item.dart';

class ToDoListListView extends StatelessWidget {
  const ToDoListListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ToDoItem();
      },
    );
  }
}
