import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/search_cubit/search_note_cubit.dart';
import 'package:note_app/widgets/search_notes_view_body.dart';

class SearchNotesView extends StatelessWidget {
  const SearchNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: const Scaffold(
        body: SearchNotesViewBody(),
      ),
    );
  }
}
