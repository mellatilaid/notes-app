import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/widgets/folder_sub_folders_body.dart';

import '../widgets/folder_subnotes_body.dart';

class FolderContentView extends StatelessWidget {
  final FolderModel folder;
  //final int index;
  const FolderContentView({
    super.key,
    required this.folder,
    //required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(folder.title),
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
        body: TabBarView(children: [
          FolderSubNotesBody(
            folder: folder,
          ),
          const FolderSubFoldersBody(),
        ]),
      ),
    );
  }
}
