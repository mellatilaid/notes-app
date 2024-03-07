import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/folders_cubits/add_folder_cubit/add_folder_cubit.dart';
import '../helper/const.dart';
import 'color_item.dart';

class EditFolderColorsListView extends StatefulWidget {
  final int folderColor;
  const EditFolderColorsListView({super.key, required this.folderColor});

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
    itemSelected = kColors.indexOf(Color(widget.folderColor));
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
                  BlocProvider.of<AddFolderCubit>(context).folderColer =
                      kColors[index].value;
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
