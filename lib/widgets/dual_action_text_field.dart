import 'package:flutter/material.dart';

import '../helper/const.dart';

class DualActionTextField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,

      //if the text field is user in adding new folder
      //call the validator function otherwise not
      validator: isNewFolder
          ? (value) {
              return validateFolderTitle(value);
            }
          : null,
      decoration: InputDecoration(
        hintText: hintText,
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
