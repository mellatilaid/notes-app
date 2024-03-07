import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/widgets/custom_action_button.dart';
import 'package:note_app/widgets/edit_folder_colors_list_view.dart';

import 'custom_text_button.dart';
import 'new_folder_text_field.dart';

class EditFolderBottomSheet extends StatefulWidget {
  final FolderModel folder;
  const EditFolderBottomSheet({super.key, required this.folder});

  @override
  State<EditFolderBottomSheet> createState() => _EditFolderBottomSheetState();
}

class _EditFolderBottomSheetState extends State<EditFolderBottomSheet> {
  final TextEditingController _folderNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _folderNameController.text = widget.folder.title;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _folderNameController.dispose();
  }

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
          NewFolderTextField(controller: _folderNameController),
          const SizedBox(
            height: 8,
          ),
          EditFolderColorsListView(
            folderColor: widget.folder.color,
          ),
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
          const SizedBox(
            height: 32,
          ),
          CustomActionButton(
            title: 'Save Edit',
            onPressed: () {},
            backGroundColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}

class EditFolderBottomSheetBody extends StatefulWidget {
  const EditFolderBottomSheetBody({super.key});

  @override
  State<EditFolderBottomSheetBody> createState() =>
      _EditFolderBottomSheetBodyState();
}

class _EditFolderBottomSheetBodyState extends State<EditFolderBottomSheetBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NewFolderTextField(controller: _controller),
        const SizedBox(
          height: 8,
        ),
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
        const SizedBox(
          height: 32,
        ),
        CustomActionButton(
          title: 'Save Edit',
          onPressed: () {},
          backGroundColor: kPrimaryColor,
        ),
      ],
    );
  }
}
