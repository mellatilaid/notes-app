import 'package:flutter/material.dart';

class FolderSubFoldersBody extends StatelessWidget {
  const FolderSubFoldersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 0,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 20,
            color: Colors.blue,
          );
        },
      ),
    );
  }
}
