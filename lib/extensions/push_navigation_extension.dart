import 'package:flutter/material.dart';

extension Navigation on BuildContext {
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
