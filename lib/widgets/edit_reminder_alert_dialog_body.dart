import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/reminders_cubits/reminders_cubit/reminders_cubit.dart';
import 'package:note_app/helper/add_sheduled_notification.dart';
import 'package:note_app/helper/convert_to_datetime.dart';
import 'package:note_app/helper/date_time_to_%20string.dart';
import 'package:note_app/helper/datetimepicker.dart';
import 'package:note_app/helper/generate_unique_id.dart';
import 'package:note_app/models/reminder_model.dart';
import 'package:note_app/services/local_notifications_service.dart';
import 'package:note_app/widgets/color_picker.dart';
import 'package:note_app/widgets/dual_action_text_field.dart';

import '../helper/const.dart';
import 'custom_picker_text_field.dart';

class EditReminderAlertDialogBody extends StatefulWidget {
  final ReminderModel reminder;
  const EditReminderAlertDialogBody({super.key, required this.reminder});

  @override
  State<EditReminderAlertDialogBody> createState() =>
      _EditReminderAlertDialogBodyState();
}

class _EditReminderAlertDialogBodyState
    extends State<EditReminderAlertDialogBody> {
  final TextEditingController _reminderTitleController =
      TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isButtonEnabled = false;
  int colorIndex = 0;
  @override
  void initState() {
    super.initState();
    _setInitialValues();
    colorIndex = kColors.indexOf(Color(widget.reminder.color!));
  }

  _setInitialValues() {
    DateTime dateTime = DateTime.parse(widget.reminder.date);
    _reminderTitleController.text = widget.reminder.title;

    try {
      _dateController.text = DateFormat('dd/MM/yyyy').format(dateTime);
      _timeController.text = DateFormat('HH:mm').format(dateTime);
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _reminderTitleController.dispose();
  }

  void _handleColorSelection(Color color) {
    widget.reminder.color = color.value;
    widget.reminder.save();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        DateTimePicker().resetSelectedDate();
                      },
                      icon: const Icon(Icons.close),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          _editReminder(
                            context: context,
                            reminderModel: widget.reminder,
                          );
                          Navigator.pop(context);
                          _updateRemindersList(context);
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                        DateTimePicker().resetSelectedDate();
                      },
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
                DualActionTextField(
                  controller: _reminderTitleController,
                  hintText: 'Reminder Title',
                ),
                const SizedBox(
                  height: 16,
                ),
                PickerTextField(
                  controller: _dateController,
                  onTap: () async {
                    _setReminderDate();
                  },
                  hintText: 'Choose Date',
                ),
                const SizedBox(
                  height: 8,
                ),
                PickerTextField(
                  controller: _timeController,
                  hintText: 'Reminder Time',
                  onTap: () async {
                    _setReminderTime();
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ColorPicker(
                  onColorSelected: _handleColorSelection,
                  selectedColor: colorIndex,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _editReminder(
      {required BuildContext context, required ReminderModel reminderModel}) {
    LocalNotifications().cancelNotification(widget.reminder.id);
    _saveEdits();
    addSheduledNotification(
        reminderModel: reminderModel, notificationSource: 'reminders');
  }

  _saveEdits() {
    final newID = generateUniqueId();
    widget.reminder.id = newID;
    widget.reminder.title = _reminderTitleController.text;

    widget.reminder.date = convertToDateTime(
      _dateController.text,
      _timeController.text,
    );
    widget.reminder.save();
  }

  _updateRemindersList(BuildContext context) {
    BlocProvider.of<RemindersCubit>(context).fetchAllNotes();
  }

  _setReminderDate() async {
    DateTime? selectDate = await DateTimePicker().selectDate(context);
    if (selectDate != null) {
      _dateController.text = DateTimeToString().dateToString(time: selectDate);
    }
  }

  _setReminderTime() async {
    TimeOfDay? selectedTime = await DateTimePicker().seleceTime(context);
    if (selectedTime != null) {
      _timeController.text =
          DateTimeToString().timeToString(time: selectedTime);
      setState(() {
        isButtonEnabled = true;
      });
    } else {
      _timeController.text = 'Pick future time >= 5 min later';
    }
  }
}
