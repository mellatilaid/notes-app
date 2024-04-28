import 'package:flutter/material.dart';

class DisplayImageView extends StatefulWidget {
  const DisplayImageView({super.key});

  @override
  State<DisplayImageView> createState() => _DisplayImageViewState();
}

class _DisplayImageViewState extends State<DisplayImageView> {
  bool isReadOnly = true;
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
            onPressed: () {},
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
    );
  }
}
