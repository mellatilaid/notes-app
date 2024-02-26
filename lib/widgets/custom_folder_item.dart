import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_app/models/folder_model.dart';

class CustomFolderItem extends StatefulWidget {
  final FolderModel folder;
  const CustomFolderItem({super.key, required this.folder});

  @override
  State<CustomFolderItem> createState() => _CustomFolderItemState();
}

class _CustomFolderItemState extends State<CustomFolderItem> {
  OverlayEntry? entry;
  final LayerLink layerLink = LayerLink();
  showOverlay() {
    final overlay = Overlay.of(context);
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: size.width + 20,
          height: 250,
          child: CompositedTransformFollower(
              link: layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height - 24),
              child: buildOverlay()),
        );
      },
    );
    overlay.insert(entry!);
  }

  hideOverlay() {
    entry?.remove();
    entry = null;
  }

  Widget buildOverlay() {
    return const Material(
      elevation: 10,
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(16),
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text('mellati laid'),
            ),
            ListTile(
              title: Text('mellati laid'),
            ),
            ListTile(
              title: Text('mellati laid'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: GestureDetector(
            onLongPress: () {
              showOverlay();
              Timer(const Duration(seconds: 2), () {
                hideOverlay();
              });
            },
            child: CompositedTransformTarget(
              link: layerLink,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(widget.folder.color),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          truncateWithDashes(widget.folder.title, 2),
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
