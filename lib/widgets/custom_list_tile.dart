import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final Widget leading;
  final VoidCallback? onTap;
  const CustomListTile({
    super.key,
    required this.title,
    required this.leading,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      onTap: onTap,
    );
  }
}
