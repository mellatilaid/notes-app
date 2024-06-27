import 'package:flutter/material.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/widgets/edit_folder_bottom_sheet.dart';

import '../widgets/custom_alert_dialag.dart';
import '../widgets/overlay_action_tile.dart';

class OverlayHelper {
  OverlayEntry? entry;
  final LayerLink layerLink;
  final BuildContext context;
  final FolderModel folder;
  OverlayHelper({
    required this.context,
    required this.layerLink,
    required this.folder,
  });
  showOverlay() {
    final overlay = Overlay.of(context);
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);
    double dx = 0;
    double dy = size.height - 24;
    setOverlayOffset() {
      final Size screenSize = MediaQuery.of(context).size;

      if (screenSize.width - position.dx < 200) {
        dx = (screenSize.width - position.dx);
      }
      if (screenSize.height - (position.dy + size.height) < 200) {
        dy = 0;
      }
    }

    entry = OverlayEntry(
      builder: (context) {
        setOverlayOffset();
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            hideOverlay();
          },
          child: Stack(
            children: [
              Positioned(
                width: 200,
                height: 130,
                child: CompositedTransformFollower(
                  link: layerLink,
                  showWhenUnlinked: false,
                  offset: Offset(-dx, dy),
                  child: buildOverlay(),
                ),
              ),
            ],
          ),
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
    return Material(
      key: GlobalKey(),
      elevation: 20,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Color.fromARGB(255, 224, 224, 224)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      color: const Color.fromARGB(255, 48, 48, 48),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            OverlayActionTile(
              title: 'Edit',
              leading: const Icon(Icons.edit),
              onTap: () {
                hideOverlay();
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return EditFolderBottomSheet(
                      folder: folder,
                    );
                  },
                );
              },
            ),
            OverlayActionTile(
              title: 'Delete',
              leading: const Icon(Icons.delete),
              onTap: () {
                hideOverlay();
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomAlertDialag(
                      folder: folder,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
