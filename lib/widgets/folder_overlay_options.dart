import 'package:flutter/material.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/widgets/custom_folder_item.dart';

import '../helper/overlay_helper.dart';

class FolderOverlayOptions extends StatefulWidget {
  final FolderModel folder;
  final int folderIndex;
  const FolderOverlayOptions({
    super.key,
    required this.folder,
    required this.folderIndex,
  });

  @override
  State<FolderOverlayOptions> createState() => _FolderOverlayOptionsState();
}

class _FolderOverlayOptionsState extends State<FolderOverlayOptions> {
  late final OverlayHelper overlayHelper;
  final LayerLink layerLink = LayerLink();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    overlayHelper = OverlayHelper(
      context: context,
      layerLink: layerLink,
      folder: widget.folder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: CustomFolderItem(
        folderIndex: widget.folderIndex,
        folder: widget.folder,
        onTap: () {
          overlayHelper.showOverlay();
        },
      ),
    );
  }
}
