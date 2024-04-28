import 'package:flutter/material.dart';

import '../widgets/display_image_view_body.dart';

class DisplayImageView extends StatefulWidget {
  const DisplayImageView({super.key});

  @override
  State<DisplayImageView> createState() => _DisplayImageViewState();
}

class _DisplayImageViewState extends State<DisplayImageView> {
  bool isReadOnly = true;
  final GlobalKey<DisplayImageViewBodyState> displayImageVoiceBodyStateKey =
      GlobalKey();

  //when save icon cicked
  //then call saveEdit method of voice player view body
  _onEditSaved() {
    if (displayImageVoiceBodyStateKey.currentState != null &&
        displayImageVoiceBodyStateKey.currentState!.mounted) {
      displayImageVoiceBodyStateKey.currentState!;
      setState(() {
        isReadOnly = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: !isReadOnly
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.done,
                ),
              )
            : const SizedBox(),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isReadOnly = !isReadOnly;
              });
            },
            icon: const Icon(
              Icons.edit,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_forever,
            ),
          ),
        ],
      ),
      body: const DisplayImageViewBody(),
    );
  }
}
