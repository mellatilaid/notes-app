import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folders_cubit/folders_cubit.dart';
import 'package:note_app/widgets/notes_collections_view_body.dart';

import '../widgets/custom_floating_action_button.dart';
import '../widgets/new_folder_bottom_sheet.dart';

class NotesCollectionsView extends StatelessWidget {
  const NotesCollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoldersCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: const Text('My Collections'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
        drawer: const Drawer(),
        body: const NotesCollectionsViewBody(),
        floatingActionButton: CustomFlaotingActionButton(
          child: const Icon(Icons.add),
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              context: context,
              builder: (context) {
                return const NewFolderBottomSheet();
              },
            );
          },
        ),
      ),
    );
  }
}
