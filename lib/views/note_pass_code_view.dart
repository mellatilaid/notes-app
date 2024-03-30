import 'package:flutter/material.dart';

class NotePassCodeView extends StatelessWidget {
  const NotePassCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Create PassCode'),
      ),
    );
  }
}
