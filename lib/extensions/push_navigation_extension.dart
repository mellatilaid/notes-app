import 'package:flutter/material.dart';

extension PushExtension on BuildContext {
  toView(view) {
    return Navigator.push(
      this,
      MaterialPageRoute(
        builder: ((context) {
          return view;
        }),
      ),
    );
  }
}
