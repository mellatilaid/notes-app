import 'package:flutter/material.dart';

class ToDoListView extends StatelessWidget {
  const ToDoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My To Dos'),
      ),
    );
  }
}
