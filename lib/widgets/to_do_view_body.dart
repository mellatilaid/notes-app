import 'package:flutter/material.dart';
import 'package:note_app/widgets/to_do_list_builder.dart';

class ToDoViewBody extends StatefulWidget {
  const ToDoViewBody({super.key});

  @override
  State<ToDoViewBody> createState() => _ToDoViewBodyState();
}

class _ToDoViewBodyState extends State<ToDoViewBody> {
  @override
  Widget build(BuildContext context) {
    return const ToDoListBuilder();
  }
}
