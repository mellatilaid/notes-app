import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/cubits/image_notes_cubits_folder/add_image_note_cubit/add_image_note_cubit_cubit.dart';
import 'package:note_app/helper/local_file_manager.dart';
import 'package:note_app/helper/note_added_time_formater.dart';
import 'package:note_app/helper/show_snak_bar.dart';
import 'package:note_app/models/image_note_model.dart';
import 'package:note_app/widgets/invisible_text_field.dart';
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
  final TextEditingController _imageNoteTitleController =
      TextEditingController();
  final TextEditingController _iamgeNoteContentController =
      TextEditingController();
  String? imageNotePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 28,
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
              width: double.infinity,
              child: Card(
                elevation: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: (imageNotePath != null)
                      ? Image.file(
                          File(imageNotePath!),
                          fit: BoxFit.cover,
                        )
                      : Image.asset('assets/text.png'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            InvisibleTextField(
              controller: _imageNoteTitleController,
              hintText: 'Image Title',
              textStyle: Theme.of(context).textTheme.headlineSmall,
            ),
            InvisibleTextField(
              controller: _iamgeNoteContentController,
              hintText: 'Note',
            ),
            const SectionDividerWithTitle(title: 'Upload image'),
            const SizedBox(height: 8),
            CustomTextButton(
              title: 'Choose Image',
              onPressed: () async {
                final imagePath = await _imagePicker(
                  context: context,
                  imageSource: ImageSource.gallery,
                );
                //if iamgePath var not null then set state to display
                //picked image to the user immedietly
                if (imagePath != null) {
                  setState(() {
                    imageNotePath = imagePath;
                  });
                }
              },
            ),
            CustomTextButton(
              title: 'Take Image',
              onPressed: () async {
                final imagePath = await _imagePicker(
                  context: context,
                  imageSource: ImageSource.camera,
                );
                if (imagePath != null) {
                  setState(() {
                    imageNotePath = imagePath;
                  });
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<AddImageNoteCubit, AddImageNoteCubitState>(
              builder: (context, state) {
                return CustomActionButton(
                  isLoading: (state is AddImageNoteLoadingState) ? true : false,
                  title: 'Create Note',
                  onPressed: () async {
                    if (imageNotePath != null) {
                      final addImageNoteCubit =
                          context.read<AddImageNoteCubit>();
                      await _addImageNoteToTheDB(
                        addImageNoteCubit: addImageNoteCubit,
                        title: _imageNoteTitleController.text,
                        content: _iamgeNoteContentController.text,
                      );
                    } else {
                      showSnakBar(
                        context,
                        message: 'Upload image first',
                      );
                    }
                  },
                  backGroundColor: kPrimaryColor,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _imagePicker(
      {required BuildContext context, required ImageSource imageSource}) async {
    final pickedImage = await ImageHelper().pickImage(
      imageSource: imageSource,
    );

    if (pickedImage != null) {
      return pickedImage.path;
    }
    return null;
  }

  //assemble seperated variable into image note model
  ImageNoteModel _assembleImageNoteEntry({
    required String imagePath,
    required String title,
    required String content,
  }) {
    return ImageNoteModel(
      imagePath: imagePath,
      imageTitle: title,
      imageContent: content,
      date: noteFormatDate(time: DateTime.now()),
    );
  }

  //adds image to the Data base
  _addImageNoteToTheDB({
    required AddImageNoteCubit addImageNoteCubit,
    required String title,
    required String content,
  }) async {
    //save image file to local
    final String imageLocalPath =
        await LocalFileManager(filePath: imageNotePath!).saveFileToLocal();
    //assemble the received aurgument into image note model
    final ImageNoteModel imageNote = _assembleImageNoteEntry(
      imagePath: imageLocalPath,
      title: _imageNoteTitleController.text,
      content: _iamgeNoteContentController.text,
    );
    //add note to the hive data base
    if (!mounted) return;
    BlocProvider.of<AddImageNoteCubit>(context)
        .addImageNote(imageNote: imageNote);
  }
}
