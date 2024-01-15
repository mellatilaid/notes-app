import 'package:flutter/material.dart';

class NotesCollectionsView extends StatelessWidget {
  const NotesCollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('My Collections'),
      ),
    );
  }
}
