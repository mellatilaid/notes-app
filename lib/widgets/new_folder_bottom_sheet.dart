import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_text_button.dart';
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
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NewFolderTextField(controller: _controller),
          const SizedBox(
            height: 8,
          ),
          const FoldersColorsListView(),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                  child: Divider(
                height: 2,
                color: Colors.grey.withOpacity(0.5),
              )),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('Upload Folder Cover'),
              ),
              Expanded(
                child: Divider(
                  height: 2,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextButton(
            title: 'Gallery',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
