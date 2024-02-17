import 'package:flutter/material.dart';

import '../helper/const.dart';
import '../models/note_model.dart';
import 'color_item.dart';

class EditNoteColorsListView extends StatefulWidget {
  final NoteModel note;
  const EditNoteColorsListView({super.key, required this.note});

  @override
  State<EditNoteColorsListView> createState() => _EditNoteColorsListViewState();
}

class _EditNoteColorsListViewState extends State<EditNoteColorsListView> {
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
                  widget.note.color = kColors[index].value;
                  widget.note.save();
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
