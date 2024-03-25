import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/add_sub_note_cubit/add_sub_note_cubit.dart';

import '../helper/const.dart';
import 'color_item.dart';

class AddSubNoteColorsListView extends StatefulWidget {
  const AddSubNoteColorsListView({super.key});

  @override
  State<AddSubNoteColorsListView> createState() =>
      _AddSubNoteColorsListViewState();
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
                    BlocProvider.of<AddSubNoteCubit>(context).folderColor =
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
