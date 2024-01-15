import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomNoteTitle(),
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 16),
              child: Text(
                '22/03/2002',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6), fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNoteTitle extends StatelessWidget {
  const CustomNoteTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: const Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Text(
          'note title',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      subtitle: Text(
        'note subtitle',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black.withOpacity(0.6),
        ),
      ),
      trailing: IconButton(
        padding: const EdgeInsets.only(right: 8),
        onPressed: () {},
        icon: const Icon(
          Icons.delete,
          color: Colors.black,
        ),
      ),
    );
  }
}
