import 'package:flutter/material.dart';

class DateTimeToString {
  String dateToString({required DateTime time}) {
    final year = time.year.toString();

    final String month = time.month.toString();

    final String day = time.day.toString();

    return '$day/$month/$year';
  }

  String timeToString({required TimeOfDay time}) {
    final String hour = time.hour.toString();
    final String minute = time.minute.toString();
    return '$hour:$minute';
  }
}
