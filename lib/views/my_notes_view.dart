import 'package:flutter/material.dart';
import 'package:note_app/widgets/my_notes_view_body.dart';

class MyNotesView extends StatelessWidget {
  const MyNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text('My Notes'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: const Drawer(),
      body: const MyNotesViewBody(),
    );
  }
}
