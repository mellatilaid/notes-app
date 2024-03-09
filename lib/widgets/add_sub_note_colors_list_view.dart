import 'package:flutter/material.dart';

import '../helper/const.dart';
import 'color_item.dart';

class AddSubNoteColorsListView extends StatefulWidget {
  const AddSubNoteColorsListView({super.key});

  @override
  State<AddSubNoteColorsListView> createState() => _AddSubNoteColorsListViewState();
}

class _AddSubNoteColorsListViewState extends State<AddSubNoteColorsListView> {
  int itemSelected = 0;
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
