import 'package:flutter/material.dart';

import '../helper/const.dart';

class NewFolderTextField extends StatelessWidget {
  const NewFolderTextField({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      validator: (value) {
        return validateFolderTitle(value);
      },
      decoration: InputDecoration(
        hintText: 'Enter the folder name',
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
