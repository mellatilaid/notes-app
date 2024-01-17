import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';

class CustomActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color backGroundColor;
  final bool isLoading;
  const CustomActionButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.backGroundColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 30),
        backgroundColor: backGroundColor,
      ),
      onPressed: onPressed,
      child: isLoading
          ? const SizedBox(
              height: 22,
              width: 22,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : Text(
              title,
              style: const TextStyle(
                color: kforeGroundColor,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
