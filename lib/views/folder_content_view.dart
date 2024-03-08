import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/widgets/folder_sub_folders_body.dart';

import '../widgets/folder_subnotes_body.dart';

class FolderContentView extends StatelessWidget {
  const FolderContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        body: const TabBarView(children: [
          FolderSubNotesBody(),
          FolderSubFoldersBody(),
        ]),
      ),
    );
  }
}
