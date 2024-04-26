import 'package:flutter/material.dart';
import 'package:note_app/widgets/section_divider_with_title.dart';

import '../helper/const.dart';
import 'custom_action_button.dart';
import 'custom_text_button.dart';
import 'dual_action_text_field.dart';

class AddImageNoteBottomSheetBody extends StatefulWidget {
  const AddImageNoteBottomSheetBody({super.key});

  @override
  State<AddImageNoteBottomSheetBody> createState() =>
      _AddImageNoteBottomSheetBodyState();
}

class _AddImageNoteBottomSheetBodyState
    extends State<AddImageNoteBottomSheetBody> {
  final TextEditingController imageNoteTitleController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 350,
            child: Card(
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('assets/text.png'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          DualActionTextField(
            controller: imageNoteTitleController,
            hintText: 'Enter image title',
          ),
          const SizedBox(height: 10),
          const SectionDividerWithTitle(title: 'Upload image'),
          const SizedBox(height: 8),
          CustomTextButton(title: 'Upload Image', onPressed: () {}),
          const SizedBox(
            height: 16,
          ),
          CustomActionButton(
            title: 'Add Image',
            onPressed: () {},
            backGroundColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
