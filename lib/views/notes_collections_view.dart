import 'package:flutter/material.dart';

class NotesCollectionsView extends StatelessWidget {
  const NotesCollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Collections'),
      ),
    );
  }
}
