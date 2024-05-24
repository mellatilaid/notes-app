import 'package:flutter/material.dart';

class DateTimeFormatter {
  String dateFormatter({required DateTime time}) {
    final year = time.year.toString();

    final String month = time.month.toString();

    final String day = time.day.toString();

    return '$day/$month/$year';
  }

  String timeFormatter({required TimeOfDay time}) {
    final String hour = time.hour.toString();
    final String minute = time.minute.toString();
    return '$hour:$minute';
  }
}
