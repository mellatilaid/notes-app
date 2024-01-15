import 'package:flutter/material.dart';

class AddNotesView extends StatelessWidget {
  const AddNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Add Note'),
      ),
    );
  }
}
