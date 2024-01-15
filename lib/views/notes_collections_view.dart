import 'package:flutter/material.dart';
import 'package:note_app/widgets/notes_collections_view_body.dart';

class NotesCollectionsView extends StatelessWidget {
  const NotesCollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text('My Collections'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: const Drawer(),
      body: const NotesCollectionsViewBody(),
    );
  }
}
