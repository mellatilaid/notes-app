import 'package:flutter/material.dart';
import 'package:note_app/models/folder_model.dart';

import '../helper/const.dart';
import 'color_item.dart';

class EditFolderColorsListView extends StatefulWidget {
  final FolderModel folder;
  final Function onChnagedColor;
  const EditFolderColorsListView(
      {super.key, required this.folder, required this.onChnagedColor});

  @override
  State<EditFolderColorsListView> createState() =>
      _EditFolderColorsListViewState();
}

class _EditFolderColorsListViewState extends State<EditFolderColorsListView> {
  int itemSelected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.folder.color != Colors.blue.value) {
      itemSelected = kColors.indexOf(Color(widget.folder.color));
    }
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
                  widget.folder.color = kColors[index].value;
                  widget.onChnagedColor();
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
