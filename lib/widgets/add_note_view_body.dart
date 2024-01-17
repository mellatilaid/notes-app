import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/widgets/custom_action_button.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class AddNoteViewBody extends StatelessWidget {
  const AddNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CustomTextField(
            hintText: 'Title',
          ),
          const SizedBox(
            height: 4,
          ),
          const Expanded(
            child: CustomTextField(
              hintText: 'Content',
              isExpand: true,
            ),
          ),
          CustomActionButton(
            title: 'Save Note',
            onPressed: () {},
            backGroundColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
