import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/image_notes_cubits_folder/image_notes_cubit/image_notes_cubit_cubit.dart';
import 'package:note_app/widgets/empty_widget.dart';

import 'image_notes_list_view.dart';

class ImageNotesViewBody extends StatefulWidget {
  const ImageNotesViewBody({super.key});

  @override
  State<ImageNotesViewBody> createState() => _ImageNotesViewBodyState();
}

class _ImageNotesViewBodyState extends State<ImageNotesViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ImageNotesCubit>(context).fetchAllImageNotes();
  }

  @override
  Widget build(BuildContext context) {
    return const ImageNotesViewBuilder();
  }
}

class ImageNotesViewBuilder extends StatelessWidget {
  const ImageNotesViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageNotesCubit, ImageNotesCubitState>(
      builder: (context, state) {
        if (state is ImageNotesSucusState) {
          if (state.imageNotes.isEmpty) {
            return const EmptyWidget(
              title: 'Image notes is empty',
              message: 'Add your first image note',
              imagePath: '',
            );
          } else {
            return const ImageNotesListView();
          }
        } else {
          return const Center(
            child: Text('oops there was a problem'),
          );
        }
      },
    );
  }
}
