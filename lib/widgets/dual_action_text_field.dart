import 'package:flutter/material.dart';
import 'package:note_app/helper/detect_text_direction.dart';

import '../helper/const.dart';

class DualActionTextField extends StatefulWidget {
  const DualActionTextField({
    super.key,
    required TextEditingController controller,
    this.isNewFolder = true,
    required this.hintText,
  }) : _controller = controller;

  final TextEditingController _controller;
  final bool isNewFolder;
  final String hintText;

  @override
  State<DualActionTextField> createState() => _DualActionTextFieldState();
}

class _DualActionTextFieldState extends State<DualActionTextField> {
  TextDirection _textDirection = TextDirection.ltr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._controller.addListener(() {
      updateTextDirection(widget._controller.text);
    });
  }

  updateTextDirection(String text) {
    if (hasAnyRtl(text)) {
      setState(() {
        _textDirection = TextDirection.rtl;
      });
    } else {
      setState(() {
        _textDirection = TextDirection.ltr;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      textDirection: _textDirection,
      //if the text field is user in adding new folder
      //call the validator function otherwise not
      validator: widget.isNewFolder
          ? (value) {
              return validateFolderTitle(value);
            }
          : null,
      decoration: InputDecoration(
        hintText: widget.hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: kPrimaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: kPrimaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  String? validateFolderTitle(String? value) {
    // Check if the value is empty
    if (value?.isEmpty ?? true) {
      return 'Please enter a folder title';
    }
    // Return null if the value is valid
    return null;
  }
}
