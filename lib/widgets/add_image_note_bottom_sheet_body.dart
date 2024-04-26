import 'dart:io';

import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_text_field.dart';
import 'package:note_app/widgets/section_divider_with_title.dart';

import '../helper/const.dart';
import '../helper/image_helper.dart';
import 'custom_action_button.dart';
import 'custom_text_button.dart';

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
  String? imageNotePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 350,
              child: Card(
                elevation: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: (imageNotePath != null)
                      ? Image.file(
                          File(imageNotePath!),
                          fit: BoxFit.contain,
                        )
                      : Image.asset('assets/text.png'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            InvisibleTextField(
              controller: imageNoteTitleController,
              hintText: 'Image Title',
              textStyle: Theme.of(context).textTheme.headlineSmall,
            ),
            InvisibleTextField(
              controller: imageNoteTitleController,
              hintText: 'Note',
            ),
            const SectionDividerWithTitle(title: 'Upload image'),
            const SizedBox(height: 8),
            CustomTextButton(
                title: 'Upload Image',
                onPressed: () async {
                  final imagePath = await _imagePicker(context: context);
                  //if iamgePath var not null then set state to display
                  //picked image to the user immedietly
                  if (imagePath != null) {
                    setState(() {
                      imageNotePath = imagePath;
                    });
                  }
                }),
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
      ),
    );
  }

  _imagePicker({required BuildContext context}) async {
    final pickedImage = await ImageHelper().pickImage();

    if (pickedImage != null) {
      return pickedImage.path;
    }
    return null;
  }
}
