import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/widgets/custom_action_button.dart';

import 'custom_text_button.dart';
import 'folders_colors_list_view.dart';
import 'new_folder_text_field.dart';

class EditFolderBottomSheet extends StatelessWidget {
  const EditFolderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: const EditFolderBottomSheetBody(),
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
