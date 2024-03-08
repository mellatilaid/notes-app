import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_rounded_icon.dart';

import '../models/folder_model.dart';
import 'custom_folder_cover_item.dart';

class FolderCoverStack extends StatefulWidget {
  final FolderModel folderModel;
  const FolderCoverStack({super.key, required this.folderModel});

  @override
  State<FolderCoverStack> createState() => _FolderCoverStackState();
}

class _FolderCoverStackState extends State<FolderCoverStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomFolderCoverItem(
          folderModel: widget.folderModel,
        ),
        (widget.folderModel.coverPath != null)
            ? Positioned(
                top: -10,
                left: -10,
                child: CustomRoundedIcon(
                  icon: Icons.delete,
                  onTap: () {
                    widget.folderModel.coverPath = null;
                    widget.folderModel.save();
                    _onDelete();
                  },
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  _onDelete() {
    setState(() {});
  }
}
