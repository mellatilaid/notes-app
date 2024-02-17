import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';

import 'color_item.dart';

class FoldersColorsListView extends StatefulWidget {
  const FoldersColorsListView({super.key});

  @override
  State<FoldersColorsListView> createState() => _FoldersColorsListViewState();
}

class _FoldersColorsListViewState extends State<FoldersColorsListView> {
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
                onTap: () {},
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
