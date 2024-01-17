import 'package:flutter/material.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int itemSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 24 * 2,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    itemSelected = index;
                  });
                },
                child: ColorItem(
                  isItemSelected: itemSelected == index,
                ),
              );
            }),
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  final bool isItemSelected;
  const ColorItem({super.key, this.isItemSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: isItemSelected
          ? const CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.green,
              ),
            )
          : const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.green,
            ),
    );
  }
}
