import 'package:flutter/material.dart';
import 'package:note_app/helper/date_formatter.dart';

class DateTimePicker {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  Future<String> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      String finalDate = DateTimeFormatter().dateFormatter(time: pickedDate);
      return finalDate;
    } else {
      return 'Choose Date';
    }
  }

  Future<String> seleceTime(BuildContext context) async {
    final now = DateTime.now();
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null &&
        pickedTime != selectedTime &&
        (pickedTime.hour > now.hour ||
            (pickedTime.hour == now.hour && pickedTime.minute > now.minute))) {
      String finalTime = DateTimeFormatter().timeFormatter(time: pickedTime);
      return finalTime;
    } else {
      return 'Choose future time';
    }
  }
}
