import 'package:flutter/material.dart';

void showSnakBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      content: Text(message),
    ),
  );
}
