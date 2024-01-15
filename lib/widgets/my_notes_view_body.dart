import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

class MyNotesViewBody extends StatelessWidget {
  const MyNotesViewBody({super.key});

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
