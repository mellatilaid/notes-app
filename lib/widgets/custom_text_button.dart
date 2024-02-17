import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }
}
