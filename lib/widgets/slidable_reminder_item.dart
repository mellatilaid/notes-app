import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app/cubits/reminders_cubits/reminders_cubit/reminders_cubit.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/helper/slidable_note_enums.dart';
import 'package:note_app/models/reminder_model.dart';
import 'package:note_app/views/note_pass_code_view.dart';
import 'package:note_app/widgets/reminder_item.dart';

import '../helper/const.dart';

class SlidableReminderItem extends StatefulWidget {
  const SlidableReminderItem({
    super.key,
    required this.index,
    required this.reminder,
  });

  final int index;
  final ReminderModel reminder;

  @override
  State<SlidableReminderItem> createState() => _SlidableReminderItemState();
}

class _SlidableReminderItemState extends State<SlidableReminderItem> {
  late final RemindersCubit _remindersCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _remindersCubit = context.read<RemindersCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
          dismissible: DismissiblePane(
            onDismissed: () => _onDismissed(),
          ),
          extentRatio: 0.8,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) =>
                  _onSlidableActionTapped(context, NoteSlidableAction.delete),
              borderRadius: BorderRadius.circular(8),
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context) =>
                  _onSlidableActionTapped(context, NoteSlidableAction.share),
              borderRadius: BorderRadius.circular(8),
              backgroundColor: const Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.share,
              label: 'Share',
            ),
            SlidableAction(
              onPressed: (context) {
                context.toView(const NotePassCodeView());
              },
              borderRadius: BorderRadius.circular(8),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              icon: Icons.lock_outline,
              label: 'Lock',
            ),
          ]),
      child: ReminderItem(
        reminder: widget.reminder,
      ),
    );
  }

  //this fucntion triggred when one of slidable action button
  //tapped (delete, share)
  _onSlidableActionTapped(
    BuildContext context,
    NoteSlidableAction action,
  ) {
    switch (action) {
      case NoteSlidableAction.delete:
        _deleteNote(context);
        break;
      case NoteSlidableAction.share:
        _shareNote();
        break;
      default:
    }
  }

  _shareNote() {}

  _deleteNote(BuildContext context) {
    _remindersCubit.removeFromList(index: widget.index);
    Timer timer = Timer(const Duration(seconds: 2), () async {
      widget.reminder.delete();
    });
    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      content: const Text(
        'Reminder was deleted',
      ),
      action: SnackBarAction(
        label: 'Undo',
        textColor: kPrimaryColor,
        onPressed: () async {
          timer.cancel();
          _remindersCubit.addToList(
              index: widget.index, model: widget.reminder);
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //this function triggred when the note is dissmissed
  _onDismissed() {
    widget.reminder.delete();
    _remindersCubit.removeFromList(index: widget.index);
  }
}
