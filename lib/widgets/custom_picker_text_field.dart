import 'package:flutter/material.dart';

class PickerTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  const PickerTextField({
    super.key,
    this.hintText,
    this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.none,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(),
        ),
      ),
    );
  }
}
