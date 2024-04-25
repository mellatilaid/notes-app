import 'package:flutter/material.dart';

class OverlayActionTile extends StatelessWidget {
  final String title;
  final Widget leading;
  final VoidCallback? onTap;
  const OverlayActionTile({
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
