import 'package:flutter/material.dart';

import '../helper/const.dart';

class CustomFlaotingActionButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  const CustomFlaotingActionButton({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      child: child,
    );
  }
}
