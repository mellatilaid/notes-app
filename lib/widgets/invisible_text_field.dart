// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../helper/const.dart';

class InvisibleTextField extends StatefulWidget {
  final String? hintText;
  final int? maxLines;
  final bool isExpand;
  final FocusNode? focusNode;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  TextEditingController controller;
  final TextStyle? textStyle;
  final bool readOnly;

  InvisibleTextField({
    super.key,
    this.hintText,
    this.maxLines,
    this.onSaved,
    this.onChanged,
    this.isExpand = false,
    required this.controller,
    this.textStyle,
    this.readOnly = false,
    this.focusNode,
  });

  @override
  State<InvisibleTextField> createState() => _InvisibleTextFieldState();
}

class _InvisibleTextFieldState extends State<InvisibleTextField> {
  TextDirection? _textDirection;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.addListener(_updateTextDirection);
  }

  void _updateTextDirection() {
    final text = widget.controller.text;
    final textDirection =
        intl.Bidi.hasAnyRtl(text) ? TextDirection.rtl : TextDirection.ltr;
    setState(() {
      _textDirection = textDirection as TextDirection?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: _textDirection,
      focusNode: widget.focusNode,
      readOnly: widget.readOnly,
      autofocus: widget.readOnly,
      style: widget.textStyle,
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
