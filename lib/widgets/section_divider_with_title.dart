import 'package:flutter/material.dart';

class SectionDividerWithTitle extends StatelessWidget {
  const SectionDividerWithTitle({
    super.key,
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text('Upload Folder Cover'),
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
