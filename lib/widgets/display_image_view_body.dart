import 'package:flutter/material.dart';
import 'package:note_app/widgets/invisible_text_field.dart';

class DisplayImageViewBody extends StatefulWidget {
  const DisplayImageViewBody({Key? key}) : super(key: key);

  @override
  State<DisplayImageViewBody> createState() => DisplayImageViewBodyState();
}

class DisplayImageViewBodyState extends State<DisplayImageViewBody> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Colors.transparent,
              elevation: 5,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/messi.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InvisibleTextField(controller: _titleController),
            InvisibleTextField(controller: _contentController),
          ],
        ),
      ),
    );
  }
}
