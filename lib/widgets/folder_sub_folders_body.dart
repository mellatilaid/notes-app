import 'package:flutter/material.dart';

import '../helper/const.dart';
import 'custom_action_button.dart';

class FolderSubFoldersBody extends StatelessWidget {
  const FolderSubFoldersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
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
        ),
        CustomActionButton(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          title: 'Add SubFolder',
          onPressed: () {},
          backGroundColor: kPrimaryColor,
        ),
      ],
    );
  }
}
