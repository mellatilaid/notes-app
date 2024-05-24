import 'package:flutter/material.dart';
import 'package:note_app/widgets/search_text_field.dart';

import '../helper/const.dart';
import 'custom_picker_text_field.dart';

class AddReminderAlertDialogBody extends StatefulWidget {
  const AddReminderAlertDialogBody({super.key});

  @override
  State<AddReminderAlertDialogBody> createState() =>
      _AddReminderAlertDialogBodyState();
}

class _AddReminderAlertDialogBodyState
    extends State<AddReminderAlertDialogBody> {
  final TextEditingController _reminderTitleController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: PickerTextField(
                    onTap: () {},
                    hintText: 'Choose Date',
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: PickerTextField(
                    hintText: 'Choose Date',
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const PickerTextField(
              hintText: 'Choose Righntoon',
            ),
          ],
        ),
      ),
    );
  }
}
