import 'dart:io';

import 'package:flutter/material.dart';

import '../models/folder_model.dart';

class CustomFolderCoverItem extends StatelessWidget {
  const CustomFolderCoverItem({
    super.key,
    required this.folderModel,
  });

  final FolderModel folderModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        image: (folderModel.coverPath != null &&
                File(folderModel.coverPath!).existsSync())
            ? DecorationImage(
                image: FileImage(
                  File(folderModel.coverPath!),
                ),
                fit: BoxFit.cover,
              )
            : null,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(color: Color(folderModel.color)),
      ),
    );
  }
}
