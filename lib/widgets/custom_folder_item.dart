import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/add_sub_note_cubit/add_sub_note_cubit.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folder_subnotes_cubit/fethc_sub_notes_cubit.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/views/folder_content_view.dart';

class CustomFolderItem extends StatelessWidget {
  final FolderModel folder;
  final int folderIndex;
  final VoidCallback onTap;
  const CustomFolderItem({
    super.key,
    required this.folder,
    required this.onTap,
    required this.folderIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: GestureDetector(
            onLongPress: onTap,
            onTap: () {
              context.toView(FolderContentView(
                folder: folder,
                folderIndex: folderIndex,
              ));
              //giving the add sub note cubit the index of the folder to add the sub note to
              BlocProvider.of<AddSubNoteCubit>(context).folderIndex =
                  folderIndex;
              //giving the sub notes cubit the index of the folder that to fetch it sub notes
              BlocProvider.of<SubNotesCubit>(context).folderIndex = folderIndex;
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(folder.color),
                  image: (folder.coverPath != null &&
                          File(folder.coverPath!).existsSync())
                      ? DecorationImage(
                          image: FileImage(
                            File(folder.coverPath!),
                          ),
                          fit: BoxFit.cover,
                        )
                      : null,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  border: Border.all(
                    color: Color(folder.color),
                  )),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          truncateWithDashes(folder.title, 2),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ],
    );
  }

  String truncateWithDashes(String s, int n) {
    // Split the string by whitespace characters
    List<String> words = s.split(RegExp(r'\s+'));
    // Check the length of the list
    if (words.length <= n) {
      // Return the original string
      return s;
    } else {
      // Take the first n elements of the list
      List<String> truncated = words.take(n).toList();
      // Join the elements with a whitespace character
      String result = truncated.join(' ');
      // Append the dashes to the end
      result += ' ...';
      // Return the result
      return result;
    }
  }
}
