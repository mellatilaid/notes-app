import 'package:flutter/material.dart';

import 'invisible_text_field.dart';

class ToDoItem extends StatefulWidget {
  const ToDoItem({super.key});

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  final TextEditingController _title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InvisibleTextField(controller: _title),
          for (int i = 0; i < 2; i++)
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: false,
              onChanged: (bool? value) {
                if (value!) {}
              },
              title: const Text('laid'),
            ),
          const Padding(
            padding: EdgeInsets.only(left: 24, bottom: 8),
            child: Text(
              '...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
