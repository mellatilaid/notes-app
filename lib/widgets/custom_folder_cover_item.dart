import 'dart:io';

import 'package:flutter/material.dart';

import '../models/folder_model.dart';

class CustomFolderCoverItem extends StatefulWidget {
  const CustomFolderCoverItem({
    super.key,
    required this.folderModel,
  });

  final FolderModel folderModel;

  @override
  State<CustomFolderCoverItem> createState() => _CustomFolderCoverItemState();
}

class _CustomFolderCoverItemState extends State<CustomFolderCoverItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        color: Color(widget.folderModel.color),
        image: (widget.folderModel.coverPath != null &&
                File(widget.folderModel.coverPath!).existsSync())
            ? DecorationImage(
                image: FileImage(
                  File(widget.folderModel.coverPath!),
                ),
                fit: BoxFit.cover,
              )
            : null,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(
          color: Color(widget.folderModel.color),
        ),
      ),
    );
  }
}
