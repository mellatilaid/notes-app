import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/to_do_item_model.dart';

class SlidabletoDoItem extends StatefulWidget {
  final ToDoItemModel task;
  const SlidabletoDoItem({
    super.key,
    required this.task,
  });

  @override
  State<SlidabletoDoItem> createState() => _SlidabletoDoItemState();
}

class _SlidabletoDoItemState extends State<SlidabletoDoItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Slidable(
        key: UniqueKey(),
        startActionPane: ActionPane(
          dismissible: DismissiblePane(
            onDismissed: () => _onDelete(context: context),
          ),
          extentRatio: 0.3,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: widget.task.isChecked,
          onChanged: (value) {
            setState(() {
              widget.task.isChecked = value!;
            });
          },
          title: Text(
            widget.task.title,
            style: TextStyle(
              decoration:
                  widget.task.isChecked ? TextDecoration.lineThrough : null,
              decorationColor: widget.task.isChecked ? Colors.green : null,
              decorationThickness: 3,
            ),
          ),
        ),
      ),
    );
  }

  //this function triggred when the note is dissmissed
  _onDelete({required BuildContext context}) {}
}
