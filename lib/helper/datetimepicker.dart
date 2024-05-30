import 'package:flutter/material.dart';

class DateTimePicker {
  static DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      selectedDate = pickedDate;
      return selectedDate;
    } else {
      return null;
    }
  }

  Future<TimeOfDay?> seleceTime(BuildContext context) async {
    final now = DateTime.now();
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );
    if (pickedTime != null) {
      //if selected date is after current date, return selected time
      //else make sure time selected is a future time at least 5 min after current time
      if (!isSameDay(selectedDate, now)) {
        return pickedTime;
      } else if (pickedTime != selectedTime &&
          (pickedTime.hour > now.hour ||
              (pickedTime.hour == now.hour &&
                  pickedTime.minute > (now.minute)))) {
        return pickedTime;
      } else {
        return null;
      }
    }
    return null;
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

//because of selected date var is a static var it should be reseted once completed picking date and time
  void resetSelectedDate() {
    selectedDate = DateTime.now();
  }
}
