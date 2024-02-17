import 'package:flutter/material.dart';
import 'package:note_app/widgets/folders_colors_list_view.dart';

import 'new_folder_text_field.dart';

class NewFolderBottomSheet extends StatefulWidget {
  const NewFolderBottomSheet({super.key});

  @override
  State<NewFolderBottomSheet> createState() => _NewFolderBottomSheetState();
}

class _NewFolderBottomSheetState extends State<NewFolderBottomSheet> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: NewFolderTextField(controller: _controller),
          ),
          const SizedBox(
            height: 8,
          ),
          const FoldersColorsListView(),
        ],
      ),
    );
  }
}
