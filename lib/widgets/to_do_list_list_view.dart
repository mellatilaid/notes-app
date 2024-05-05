import 'package:flutter/material.dart';

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
        return Container(
          height: 20,
          color: Colors.blue,
        );
      },
    );
  }
}
