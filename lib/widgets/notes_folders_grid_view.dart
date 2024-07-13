import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/widgets/folder_overlay_options.dart';

class FoldersGridView extends StatelessWidget {
  final List<FolderModel> folders;
  const FoldersGridView({super.key, required this.folders});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
        child: GridView.builder(
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 30,
        childAspectRatio: 0.6,
      ),
      itemCount: folders.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredGrid(
          columnCount: 3,
          position: index,
          duration: const Duration(milliseconds: 375),
          child: ScaleAnimation(
            child: FadeInAnimation(
              child: FolderOverlayOptions(
                folderIndex: index,
                folder: folders[index],
              ),
            ),
          ),
        );
      },
    ));
    return GridView.builder(
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 30,
        childAspectRatio: 0.6,
      ),
      itemCount: folders.length,
      itemBuilder: (context, index) {
        return FolderOverlayOptions(
          folderIndex: index,
          folder: folders[index],
        );
      },
    );
  }
}
