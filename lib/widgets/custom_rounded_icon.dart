import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';

class CustomRoundedIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final double size;
  const CustomRoundedIcon(
      {super.key, required this.icon, this.onTap, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: size - 10,
        ),
      ),
    );
  }
}
