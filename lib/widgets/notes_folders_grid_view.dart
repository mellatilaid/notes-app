import 'package:flutter/material.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/widgets/custom_folder_item.dart';

class FoldersGridView extends StatelessWidget {
  final List<FolderModel> folders;
  const FoldersGridView({super.key, required this.folders});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 30,
        childAspectRatio: 0.6,
      ),
      itemCount: folders.length,
      itemBuilder: (context, index) {
        return CustomFolderItem(
          folder: folders[index],
        );
      },
    );
  }
}
