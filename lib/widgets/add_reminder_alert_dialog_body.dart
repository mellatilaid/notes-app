import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/reminders_cubits/add_reminder_cuibit/add_reminder_cubit.dart';
import 'package:note_app/cubits/reminders_cubits/reminders_cubit/reminders_cubit.dart';
import 'package:note_app/helper/date_time_to_%20string.dart';
import 'package:note_app/helper/datetimepicker.dart';
import 'package:note_app/helper/generate_unique_id.dart';
import 'package:note_app/models/reminder_model.dart';
import 'package:note_app/widgets/color_picker.dart';
import 'package:note_app/widgets/rounded_text_field.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    super.initState();
    _dateController.text =
        DateTimeToString().dateToString(time: DateTime.now());
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
                      },
                      icon: const Icon(Icons.close),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final reminderModel = _assembleReminderModel();
                          _createReminder(
                              context: context, reminderModel: reminderModel);
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
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
                    _dateController.text =
                        await DateTimePicker().selectDate(context);
                  },
                  hintText: 'Choose Date',
                ),
                const SizedBox(
                  height: 8,
                ),
                PickerTextField(
                  controller: _timeController,
                  hintText: 'Choose Time',
                  onTap: () async {
                    _timeController.text =
                        await DateTimePicker().seleceTime(context);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const PickerTextField(
                  hintText: 'Choose Righntoon',
                ),
                const SizedBox(
                  height: 16,
                ),
                ColorPicker(onColorSelected: _handleColorSelection),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //takes seperate parameters for reminder model
  ReminderModel _assembleReminderModel() {
    //genereate unique id for each reminder
    int id = generateUniqueId();
    return ReminderModel(
      id: id,
      title: _reminderTitleController.text,
      date: '${_dateController.text} ${_timeController.text}',
      color: kColors.first.value,
    );
  }

  void _createReminder(
      {required BuildContext context, required ReminderModel reminderModel}) {
    BlocProvider.of<AddReminderCubit>(context)
        .addReminder(reminderModel: reminderModel);
    BlocProvider.of<RemindersCubit>(context).fetchAllNotes();
  }
}
