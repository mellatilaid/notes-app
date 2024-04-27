import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/image_notes_cubits_folder/add_image_note_cubit/add_image_note_cubit_cubit.dart';
import 'package:note_app/cubits/image_notes_cubits_folder/image_notes_cubit/image_notes_cubit_cubit.dart';

import 'add_image_note_bottom_sheet_body.dart';

class AddImageNoteBottomSheet extends StatelessWidget {
  const AddImageNoteBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddImageNoteCubit(),
      child: BlocListener<AddImageNoteCubit, AddImageNoteCubitState>(
        listener: (context, state) {
          if (state is AddImageNoteSuccusState) {
            Navigator.pop(context);
            BlocProvider.of<ImageNotesCubit>(context).fetchAllImageNotes();
          } else if (state is AddImageNoteFailedState) {
            if (kDebugMode) {
              debugPrint('failed to add image ${state.errMessage}');
            }
          }
        },
        child: const Scaffold(
          body: AddImageNoteBottomSheetBody(),
        ),
      ),
    );
  }
}
