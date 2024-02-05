import 'package:flutter/material.dart';
import 'package:note_app/widgets/search_notes_view_body.dart';

class SearchNotesView extends StatelessWidget {
  const SearchNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchNotesViewBody(),
    );
  }
}
