import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folders_cubit/folders_cubit.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folders_cubit/folders_cubit_states.dart';

import 'notes_folders_grid_view.dart';

class NotesCollectionsViewBody extends StatefulWidget {
  const NotesCollectionsViewBody({super.key});

  @override
  State<NotesCollectionsViewBody> createState() =>
      _NotesCollectionsViewBodyState();
}

class _NotesCollectionsViewBodyState extends State<NotesCollectionsViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FoldersCubit>(context).fetchAllFolders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoldersCubit, FolderState>(
      builder: (context, state) {
        if (state is FoldersInitialState) {
          return const Text('Add Your Folders');
        } else if (state is FoldersSucussState) {
          return FoldersGridView(folders: state.folders);
        } else {
          return const Text('Oops There Was A Problem');
        }
      },
    );
  }
}
