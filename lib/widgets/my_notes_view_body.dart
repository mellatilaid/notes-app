import 'package:flutter/material.dart';

class MyNotesViewBody extends StatelessWidget {
  const MyNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
