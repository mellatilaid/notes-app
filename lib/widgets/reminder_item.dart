import 'package:flutter/material.dart';
import 'package:note_app/helper/set_border.dart';
import 'package:note_app/models/reminder_model.dart';

class ReminderItem extends StatelessWidget {
  final ReminderModel reminder;
  const ReminderItem({
    super.key,
    required this.reminder,
  });

  @override
  Widget build(BuildContext context) {
    // Format the date to a more readable form
    //final String formattedDate = DateFormat('dd/MM/yyyy').format(reminderDate);

    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: Color(reminder.color!),
        borderRadius: BorderRadius.circular(12.0),
        border: setBorder(color: reminder.color!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.alarm,
            color: _setItemColor(context),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reminder.title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: _setItemColor(context),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  reminder.date.toString(),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: _setItemColor(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _setItemColor(BuildContext context) {
    if (Color(reminder.color!) == Colors.transparent) {
      return Colors.white;
    } else {
      return Theme.of(context).primaryColor;
    }
  }
}
