import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';

import '../widgets/folder_content_view_body.dart';

class FolderContentView extends StatelessWidget {
  const FolderContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
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
        body: const FolderContentViewBody(),
      ),
    );
  }
}
