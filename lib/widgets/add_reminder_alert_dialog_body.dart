import 'package:flutter/material.dart';
import 'package:note_app/helper/date_formatter.dart';
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

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      String finalDate = DateTimeFormatter().dateFormatter(time: pickedDate);
      _dateController.text = finalDate;
    }
  }

  Future<void> _seleceTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        // Combine the date and time into a single DateTime object
        String finalTime = DateTimeFormatter().timeFormatter(time: pickedTime);
        _timeController.text = finalTime;
      });
    }
  }

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
                      await _selectDate(context);
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
                    onTap: () {
                      _seleceTime(context);
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
