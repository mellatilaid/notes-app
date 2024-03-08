import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/widgets/custom_action_button.dart';

class FolderSubNotesBody extends StatefulWidget {
  final FolderModel folder;
  const FolderSubNotesBody({super.key, required this.folder});

  @override
  State<FolderSubNotesBody> createState() => _FolderSubNotesBodyState();
}

class _FolderSubNotesBodyState extends State<FolderSubNotesBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.folder.notes.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 20,
                color: Colors.blue,
              );
            },
          ),
        ),
        CustomActionButton(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          title: 'Add Note',
          onPressed: () {},
          backGroundColor: kPrimaryColor,
        ),
      ],
    );
  }
}
