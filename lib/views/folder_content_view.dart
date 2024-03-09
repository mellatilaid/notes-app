import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/views/add_sub_note_view.dart';
import 'package:note_app/widgets/add_note_options_speed_dial.dart';
import 'package:note_app/widgets/folder_sub_folders_body.dart';

import '../widgets/folder_subnotes_body.dart';

class FolderContentView extends StatefulWidget {
  final FolderModel folder;
  //final int index;
  const FolderContentView({
    super.key,
    required this.folder,
    //required this.index,
  });

  @override
  State<FolderContentView> createState() => _FolderContentViewState();
}

class _FolderContentViewState extends State<FolderContentView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(widget.folder.title),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: kPrimaryColor,
            indicatorColor: kPrimaryColor,
            tabs: [
              Tab(
                text: 'Notes',
              ),
              Tab(
                text: 'SubFolders',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FolderSubNotesBody(
              folder: widget.folder,
            ),
            const FolderSubFoldersBody(),
          ],
        ),
        floatingActionButton: AddNoteOptionsSpeedDial(
          speedDials: [
            customSpeedDialChild(
              onTap: () => context.toView(
                AddSubNoteView(
                  folder: widget.folder,
                ),
              ),
              icon: const Icon(Icons.text_fields),
              label: 'Add Text',
            ),
            customSpeedDialChild(
                icon: const Icon(Icons.voice_chat), label: 'Add Voice'),
            customSpeedDialChild(
                icon: const Icon(Icons.image), label: 'Add Image'),
            customSpeedDialChild(
                icon: const Icon(Icons.folder), label: 'Add SubFolder'),
          ],
        ),
      ),
    );
  }

  SpeedDialChild customSpeedDialChild(
      {required Icon icon, required String label, VoidCallback? onTap}) {
    return SpeedDialChild(
      child: icon,
      // The background color of the mini FAB
      backgroundColor: Colors.grey.withOpacity(0.6),
      // The foreground color of the mini FAB
      foregroundColor: Colors.white,
      // The label of the mini FAB
      label: label,
      // The action to perform when the mini FAB is tapped
      onTap: onTap,
    );
  }
}
