import 'package:flutter/material.dart';
import 'package:note_app/widgets/search_text_field.dart';

class SearchNotesViewBody extends StatelessWidget {
  const SearchNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SearchTextField(),
        ],
      ),
    );
  }
}
