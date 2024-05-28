import 'package:flutter/material.dart';
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
        color: Colors.green,
        borderRadius: BorderRadius.circular(12.0),
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
          Icon(Icons.alarm, color: Theme.of(context).primaryColor),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reminder.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  reminder.date.toString(),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
