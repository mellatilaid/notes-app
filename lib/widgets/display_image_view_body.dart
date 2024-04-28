import 'package:flutter/material.dart';

class DisplayImageViewBody extends StatelessWidget {
  const DisplayImageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/add_text_note.png',
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
