import 'package:flutter/material.dart';
import 'package:note_app/models/folder_model.dart';

class FolderSubNotesBody extends StatefulWidget {
  final FolderModel folder;
  const FolderSubNotesBody({super.key, required this.folder});

  @override
  State<FolderSubNotesBody> createState() => _FolderSubNotesBodyState();
}

class _FolderSubNotesBodyState extends State<FolderSubNotesBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
