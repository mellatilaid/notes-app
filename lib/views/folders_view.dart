import 'package:flutter/material.dart';
import 'package:note_app/widgets/folders_view_body.dart';

class FoldersView extends StatelessWidget {
  const FoldersView({super.key});

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
      body: const FoldersViewBody(),
      /*floatingActionButton: CustomFlaotingActionButton(
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
      ),*/
    );
  }
}
