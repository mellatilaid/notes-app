import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_app_bar.dart';

class MyNotesView extends StatelessWidget {
  const MyNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CustomAppBar(
              title: 'My Notes',
              icon: Icons.search,
            ),
          ],
        ),
      ),
    );
  }
}
