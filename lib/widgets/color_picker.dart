import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';

import 'color_item.dart';

typedef OnColorSelected = void Function(Color color);

class ColorPicker extends StatefulWidget {
  final OnColorSelected onColorSelected;
  const ColorPicker({super.key, required this.onColorSelected});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
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
                    widget.onColorSelected(kColors[index]);
                    /* BlocProvider.of<AddNoteCubit>(context).itemColor =
                        kColors[index];*/
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
