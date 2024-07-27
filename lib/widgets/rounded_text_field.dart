import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';

import '../helper/detect_text_direction.dart';

class RoundedTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final String? hintText;
  final TextEditingController? controller;
  const RoundedTextField({
    super.key,
    this.onChanged,
    this.hintText,
    this.controller,
  });

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  TextDirection _textDirection = TextDirection.ltr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateTextDirection(widget.controller?.text);
    widget.controller?.addListener(() {
      updateTextDirection(widget.controller?.text);
    });
  }

  updateTextDirection(String? text) {
    if (text != null) {
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
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'reminder title cannot be empty';
        }
        return null;
      },
      controller: widget.controller,
      onChanged: widget.onChanged,
      textDirection: _textDirection,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        hintText: widget.hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
