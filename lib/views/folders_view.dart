import 'package:flutter/material.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/views/search_view.dart';
import 'package:note_app/widgets/custom_drawer.dart';
import 'package:note_app/widgets/folders_view_body.dart';

import '../widgets/custom_floating_action_button.dart';
import '../widgets/new_folder_bottom_sheet.dart';

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
          IconButton(
              onPressed: () {
                context.toView(const SearchView());
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      drawer: const CustomDrawer(),
      body: const FoldersViewBody(),
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
    );
  }
}
