import 'package:flutter/material.dart';

import '../helper/const.dart';

class AlertDialaugMessage extends StatelessWidget {
  final String content;
  const AlertDialaugMessage({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        content,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'OK',
            style: TextStyle(
              color: kPrimaryColor,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Dismiss the dialog
          },
        ),
      ],
    );
  }
}
