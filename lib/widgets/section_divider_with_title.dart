import 'package:flutter/material.dart';

class SectionDividerWithTitle extends StatelessWidget {
  final String title;
  const SectionDividerWithTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          height: 2,
          color: Colors.grey.withOpacity(0.5),
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(title),
        ),
        Expanded(
          child: Divider(
            height: 2,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
