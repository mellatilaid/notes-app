import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/reminders_cubits/reminders_cubit/reminders_cubit.dart';
import 'package:note_app/widgets/reminders_view_body_builder.dart';

class RemindersViewBody extends StatefulWidget {
  const RemindersViewBody({super.key});

  @override
  State<RemindersViewBody> createState() => _RemindersViewBodyState();
}

class _RemindersViewBodyState extends State<RemindersViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<RemindersCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return const RemindersViewBodyBuilder();
  }
}
