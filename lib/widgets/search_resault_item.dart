import 'package:flutter/material.dart';
import 'package:note_app/helper/enums.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/models/reminder_model.dart';
import 'package:note_app/models/tasks_list_model.dart';

import '../models/note_model.dart';

class SearchResaultItem<T> extends StatefulWidget {
  final T resault;

  final SearchType searchType;
  const SearchResaultItem({
    super.key,
    required this.resault,
    required this.searchType,
  });

  @override
  State<SearchResaultItem> createState() => _SearchResaultItemState();
}

class _SearchResaultItemState<T> extends State<SearchResaultItem> {
  // ignore: prefer_typing_uninitialized_variables
  var resault;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch (widget.searchType) {
      case SearchType.notes:
        resault = widget.resault as NoteModel;
        break;
      case SearchType.folders:
        resault = widget.resault as FolderModel;
        break;
      case SearchType.tasks:
        resault = widget.resault as TasksListModel;
        break;
      case SearchType.reminders:
        resault = widget.resault as ReminderModel;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //this handls wictch view to navigate to base on
        //editNoteViewOptin var
        /*switch (editNoteViewOptin) {
          case EditNote.editNoteView:
            context.toView();
            break;
          case EditNote.editSubNoteView:
            context.toView(
              EditSubNoteView(
                note: note,
              ),
            );
          default:
        }*/
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8),
          //border: setBorder(color: resault.color),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                resault.title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  /*(Color(resault.color) == Colors.transparent)
                    ? Colors.white
                    : kforeGroundColor,*/
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
