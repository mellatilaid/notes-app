import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/edit_sub_notes_cubit/edit_sub_note_cubit.dart';

import '../helper/const.dart';
import '../models/note_model.dart';
import 'color_item.dart';

class EditSubNoteColorsListView extends StatefulWidget {
  final NoteModel note;
  const EditSubNoteColorsListView({super.key, required this.note});

  @override
  State<EditSubNoteColorsListView> createState() =>
      _EditSubNoteColorsListViewState();
}

class _EditSubNoteColorsListViewState extends State<EditSubNoteColorsListView> {
  int itemSelected = 0;
  late int colorIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemSelected = kColors.indexOf(Color(widget.note.color));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 24 * 2,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: kColors.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    itemSelected = index;
                  });
                  BlocProvider.of<EditSubNoteCubit>(context).noteColor =
                      kColors[index];
                },
                child: ColorItem(
                  itemColor: kColors[index],
                  isItemSelected: itemSelected == index,
                ),
              );
            }),
      ),
    );
  }
}
