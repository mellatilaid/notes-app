import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folders_cubit/folders_cubit.dart';

import '../models/folder_model.dart';
import 'custom_action_button.dart';
import 'custom_text_button.dart';

class CustomAlertDialag extends StatelessWidget {
  const CustomAlertDialag({
    super.key,
    required this.folder,
  });

  final FolderModel folder;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        "Are you sure, you wanna delete '${folder.title}' folder",
        textAlign: TextAlign.center,
      ),
      actions: [
        CustomActionButton(
            title: 'Delete',
            onPressed: () {
              _deleteFolder(context: context);
            },
            backGroundColor: Colors.red),
        CustomTextButton(
          title: 'Cancel',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  _deleteFolder({required BuildContext context}) {
    folder.delete();
    Navigator.pop(context);
    BlocProvider.of<FoldersCubit>(context).fetchAllFolders();
  }
}
