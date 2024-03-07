import 'dart:io';

import 'package:flutter/material.dart';

import '../models/folder_model.dart';

class CustomFolderCoverItem extends StatelessWidget {
  final FolderModel folderModel;
  const CustomFolderCoverItem({super.key, required this.folderModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
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
        ),
        const Positioned(
          top: -10,
          left: -10,
          child: Icon(
            Icons.remove_sharp,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
