import 'package:flutter/material.dart';
import 'package:note_app/models/folder_model.dart';

import '../helper/const.dart';
import 'color_item.dart';

class EditFolderColorsListView extends StatefulWidget {
  final FolderModel folder;
  const EditFolderColorsListView({super.key, required this.folder});

  @override
  State<EditFolderColorsListView> createState() =>
      _EditFolderColorsListViewState();
}

class _EditFolderColorsListViewState extends State<EditFolderColorsListView> {
  late int itemSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemSelected = kColors.indexOf(Color(widget.folder.color));
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
