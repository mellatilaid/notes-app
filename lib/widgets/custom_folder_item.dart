import 'package:flutter/material.dart';
import 'package:note_app/models/folder_model.dart';

class CustomFolderItem extends StatelessWidget {
  final FolderModel folder;
  const CustomFolderItem({super.key, required this.folder});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(folder.color),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
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
