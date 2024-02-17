import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  final bool isItemSelected;
  final Color itemColor;
  const ColorItem(
      {super.key, this.isItemSelected = false, required this.itemColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: isItemSelected
          ? CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: itemColor,
              ),
            )
          : CircleAvatar(
              radius: 20,
              backgroundColor: itemColor,
            ),
    );
  }
}
