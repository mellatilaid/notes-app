import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/helper/const.dart';

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
            itemCount: kColors.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    itemSelected = index;
                    BlocProvider.of<AddNoteCubit>(context).itemColor =
                        kColors[index];
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
