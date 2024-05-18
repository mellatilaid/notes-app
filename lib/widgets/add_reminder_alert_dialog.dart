import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/widgets/search_text_field.dart';

class AddReminderAlertDialog extends StatelessWidget {
  const AddReminderAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddReminderAlertDialogBody();
  }
}

class AddReminderAlertDialogBody extends StatelessWidget {
  const AddReminderAlertDialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dialog.fullscreen(
      child: AddReminderForm(),
    );
  }
}

class AddReminderForm extends StatefulWidget {
  const AddReminderForm({super.key});

  @override
  State<AddReminderForm> createState() => _AddReminderFormState();
}

class _AddReminderFormState extends State<AddReminderForm> {
  final TextEditingController _reminderTitleController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          RoundedTextField(
            controller: _reminderTitleController,
            hintText: 'Reminder Title',
          )
        ],
      ),
    );
  }
}
