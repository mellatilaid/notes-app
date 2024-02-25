import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folders_cubit/folders_cubit.dart';

import 'notes_folders_grid_view.dart';

class NotesCollectionsViewBody extends StatelessWidget {
  const NotesCollectionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoldersCubit(),
      child: const FoldersGridView(),
    );
  }
}
