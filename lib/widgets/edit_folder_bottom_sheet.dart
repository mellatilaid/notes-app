import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folders_cubit/folders_cubit.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/widgets/custom_action_button.dart';
import 'package:note_app/widgets/edit_folder_colors_list_view.dart';

import '../helper/image_helper.dart';
import 'custom_text_button.dart';
import 'folder_cover_stack.dart';
import 'new_folder_text_field.dart';

class EditFolderBottomSheet extends StatefulWidget {
  final FolderModel folder;
  const EditFolderBottomSheet({super.key, required this.folder});

  @override
  State<EditFolderBottomSheet> createState() => _EditFolderBottomSheetState();
}

class _EditFolderBottomSheetState extends State<EditFolderBottomSheet> {
  final TextEditingController _folderNameController = TextEditingController();
  String? folderCoverPath;
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
          FolderCoverStack(folderModel: widget.folder),
          const SizedBox(
            height: 16,
          ),
          NewFolderTextField(controller: _folderNameController),
          const SizedBox(
            height: 8,
          ),
          EditFolderColorsListView(
            folder: widget.folder,
            onChnagedColor: _changeColor,
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
            onPressed: () async {
              await _imagePicker(context: context);
            },
          ),
          const SizedBox(
            height: 32,
          ),
          CustomActionButton(
            title: 'Save Edit',
            onPressed: () {
              _saveFolderEdit(folder: widget.folder);
              Navigator.pop(context);
            },
            backGroundColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }

  _saveFolderEdit({required FolderModel folder}) {
    folder.title = _folderNameController.text;
    folder.coverPath = folderCoverPath;
    folder.save();
    BlocProvider.of<FoldersCubit>(context).fetchAllFolders();
  }

  _imagePicker({required BuildContext context}) async {
    final pickedImage = await ImageHelper().pickImage();

    if (pickedImage != null) {
      folderCoverPath = pickedImage.path;
    }
  }

  void _changeColor() {
    // update the state of the widget
    setState(() {
      // change the _folderColor variable to a new color
    });
  }
}
