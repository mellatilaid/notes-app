import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/add_folder_cubit/add_folder_cubit.dart';
import 'package:note_app/cubits/folders_cubits/add_folder_cubit/add_folder_states.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/widgets/custom_action_button.dart';
import 'package:note_app/widgets/custom_text_button.dart';
import 'package:note_app/widgets/folders_colors_list_view.dart';

import '../cubits/folders_cubits/fetch_folders_cubit/folders_cubit.dart';
import 'new_folder_text_field.dart';

class NewFolderBottomSheet extends StatefulWidget {
  const NewFolderBottomSheet({super.key});

  @override
  State<NewFolderBottomSheet> createState() => _NewFolderBottomSheetState();
}

class _NewFolderBottomSheetState extends State<NewFolderBottomSheet> {
  final TextEditingController _folderTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddFolderCubit(),
      child: BlocListener<AddFolderCubit, AddFolderState>(
        listener: (context, state) {
          if (state is SucussAddFolderState) {
            Navigator.pop(context);
          } else if (state is FailureAddFolderState) {
            throw Exception('failed add folder');
          }
        },
        child: Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: AddFolderForm(folderTitleController: _folderTitleController),
        ),
      ),
    );
  }
}

class AddFolderForm extends StatefulWidget {
  const AddFolderForm({
    super.key,
    required TextEditingController folderTitleController,
  }) : _folderTitleController = folderTitleController;

  final TextEditingController _folderTitleController;

  @override
  State<AddFolderForm> createState() => _AddFolderFormState();
}

class _AddFolderFormState extends State<AddFolderForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NewFolderTextField(controller: widget._folderTitleController),
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
          BlocBuilder<AddFolderCubit, AddFolderState>(
            builder: (context, state) {
              return CustomActionButton(
                isLoading: (state is AddFolderLoadingState) ? true : false,
                title: 'Create Folder',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final addFolderCubit = context.read<AddFolderCubit>();
                    _addFolder(
                      folderTitle: widget._folderTitleController.text,
                      addFolderCubit: addFolderCubit,
                    );
                    BlocProvider.of<FoldersCubit>(context).fetchAllFolders();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                backGroundColor: kPrimaryColor,
              );
            },
          ),
        ],
      ),
    );
  }

  _addFolder(
      {required String folderTitle, required AddFolderCubit addFolderCubit}) {
    final FolderModel folder = FolderModel(
      title: folderTitle,
      color: kColors.first.value,
      folders: [],
      notes: [],
    );
    addFolderCubit.addFolder(folder: folder);
  }
}
