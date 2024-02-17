import 'package:flutter/material.dart';
import 'package:note_app/widgets/notes_collections_view_body.dart';

import '../widgets/custom_floating_action_button.dart';

class NotesCollectionsView extends StatelessWidget {
  const NotesCollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          showBottomSheet(
              context: context,
              builder: (context) {
                return const NewFolderBottomSheet();
              });
        },
      ),
    );
  }
}

class NewFolderBottomSheet extends StatelessWidget {
  const NewFolderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
