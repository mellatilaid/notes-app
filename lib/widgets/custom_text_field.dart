import 'package:flutter/material.dart';

import '../helper/const.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final bool isExpand;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines,
    this.onSaved,
    this.onChanged,
    this.isExpand = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field required";
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      expands: isExpand,
      textAlignVertical: TextAlignVertical.top,
      maxLines: maxLines,
      minLines: null,
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: const TextStyle(color: kPrimaryColor),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red,
        )),
      ),
    );
  }
}
