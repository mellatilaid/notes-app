import 'package:flutter/material.dart';
import 'package:note_app/helper/date_formatter.dart';
import 'package:note_app/helper/datetimepicker.dart';
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
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dateController.text =
        DateTimeFormatter().dateFormatter(time: DateTime.now());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _reminderTitleController.dispose();
  }

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
                    controller: _dateController,
                    onTap: () async {
                      //FocusScope.of(context).requestFocus(FocusNode());
                      _dateController.text =
                          await DateTimePicker().selectDate(context);
                    },
                    hintText: 'Choose Date',
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: PickerTextField(
                    controller: _timeController,
                    hintText: 'Choose Time',
                    onTap: () async {
                      _timeController.text =
                          await DateTimePicker().seleceTime(context);
                    },
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
