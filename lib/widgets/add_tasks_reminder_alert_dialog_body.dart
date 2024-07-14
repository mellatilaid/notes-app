import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/reminders_cubits/add_reminder_cuibit/add_reminder_cubit.dart';
import 'package:note_app/helper/add_sheduled_notification.dart';
import 'package:note_app/helper/convert_to_datetime.dart';
import 'package:note_app/helper/date_time_to_%20string.dart';
import 'package:note_app/helper/datetimepicker.dart';
import 'package:note_app/models/reminder_model.dart';
import 'package:note_app/models/tasks_list_model.dart';
import 'package:note_app/widgets/custom_picker_text_field.dart';
import 'package:note_app/widgets/rounded_text_field.dart';

import '../../helper/const.dart';

class AddTasksReminderAlertDialogBody extends StatefulWidget {
  final TasksListModel tasksListModel;
  const AddTasksReminderAlertDialogBody(
      {super.key, required this.tasksListModel});

  @override
  State<AddTasksReminderAlertDialogBody> createState() =>
      _AddTasksReminderAlertDialogBodyState();
}

class _AddTasksReminderAlertDialogBodyState
    extends State<AddTasksReminderAlertDialogBody> {
  final TextEditingController _reminderTitleController =
      TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _dateController.text =
        DateTimeToString().dateToString(time: DateTime.now());
    _reminderTitleController.text = widget.tasksListModel.title ?? '';
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
    BlocProvider.of<AddReminderCubit>(context).reminderColor = color;
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
                      onPressed: isButtonEnabled
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                final reminderModel = _assembleReminderModel();
                                _createReminder(
                                    context: context,
                                    reminderModel: reminderModel);
                              } else {
                                setState(() {
                                  autovalidateMode = AutovalidateMode.always;
                                });
                              }
                              DateTimePicker().resetSelectedDate();
                            }
                          : null,
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
                    log(_timeController.text);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //takes seperate parameters for reminder model
  ReminderModel _assembleReminderModel() {
    return ReminderModel(
      id: widget.tasksListModel.id,
      title: _reminderTitleController.text,
      date: convertToDateTime(_dateController.text, _timeController.text),
      color: kColors.first.value,
    );
  }

  void _createReminder(
      {required BuildContext context, required ReminderModel reminderModel}) {
    addSheduledNotification(
      reminderModel: reminderModel,
      notificationSource: 'tasks',
    );

    BlocProvider.of<AddReminderCubit>(context).addReminder(
      reminderModel: reminderModel,
    );
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
