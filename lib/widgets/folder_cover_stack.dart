import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_rounded_icon.dart';

import '../models/folder_model.dart';
import 'custom_folder_cover_item.dart';

class FolderCoverStack extends StatelessWidget {
  final FolderModel folderModel;
  const FolderCoverStack({super.key, required this.folderModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomFolderCoverItem(folderModel: folderModel),
        const Positioned(
          top: -10,
          left: -10,
          child: CustomRoundedIcon(
            icon: Icons.delete,
          ),
        ),
      ],
    );
  }
}
