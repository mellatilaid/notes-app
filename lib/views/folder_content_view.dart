import 'package:flutter/material.dart';

import '../widgets/folder_content_view_body.dart';

class FolderContentView extends StatelessWidget {
  const FolderContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FolderContentViewBody(),
    );
  }
}
