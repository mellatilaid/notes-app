import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';

class CustomRoundedIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const CustomRoundedIcon({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
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
          size: 20,
        ),
      ),
    );
  }
}
