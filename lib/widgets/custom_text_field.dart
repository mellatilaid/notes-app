import 'package:flutter/material.dart';

import '../helper/const.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final int? maxLines;
  final bool isExpand;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  TextEditingController controller;
  CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines,
    this.onSaved,
    this.onChanged,
    this.isExpand = false,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      cursorColor: kPrimaryColor,
      expands: widget.isExpand,
      textAlignVertical: TextAlignVertical.top,
      maxLines: widget.maxLines,
      minLines: null,
      decoration: InputDecoration(
        hintText: widget.hintText,
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
