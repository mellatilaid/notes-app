import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/add_folder_cubit/add_folder_cubit.dart';
import 'package:note_app/cubits/folders_cubits/add_folder_cubit/add_folder_states.dart';

import 'add_folder_form.dart';

class NewFolderBottomSheet extends StatefulWidget {
  const NewFolderBottomSheet({super.key});

  @override
  State<NewFolderBottomSheet> createState() => _NewFolderBottomSheetState();
}

class _NewFolderBottomSheetState extends State<NewFolderBottomSheet> {
  final TextEditingController _folderTitleController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _folderTitleController.dispose();
  }

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
