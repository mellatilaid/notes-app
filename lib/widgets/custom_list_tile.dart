import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData leading;
  final VoidCallback onTap;
  const CustomListTile({
    super.key,
    required this.title,
    required this.leading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leading,
        color: kPrimaryColor,
      ),
      title: Text(title),
      onTap: onTap,
    );
  }
}
