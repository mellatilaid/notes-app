import 'package:flutter/material.dart';

class CustomFolderItem extends StatelessWidget {
  const CustomFolderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        const Text('FOLDER Title'),
      ],
    );
  }
}
