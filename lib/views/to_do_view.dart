import 'package:flutter/material.dart';
import 'package:note_app/widgets/to_do_view_body.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text('My To Dos'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: const Drawer(),
      body: const ToDoViewBody(),
    );
  }
}
