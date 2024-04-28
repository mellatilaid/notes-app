import 'package:flutter/material.dart';
import 'package:note_app/models/image_note_model.dart';
import 'package:note_app/widgets/invisible_text_field.dart';

class DisplayImageViewBody extends StatefulWidget {
  final ImageNoteModel imageNote;
  final bool isReadOnly;
  const DisplayImageViewBody({
    Key? key,
    required this.imageNote,
    required this.isReadOnly,
  }) : super(key: key);

  @override
  State<DisplayImageViewBody> createState() => DisplayImageViewBodyState();
}

class DisplayImageViewBodyState extends State<DisplayImageViewBody> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  saveEdit() {
    //widget.imageNote.imageTitle = _titleController.text;
  }

  @override
  void initState() {
    super.initState();
    _titleController.text =
        widget.imageNote.title!.isEmpty ? 'Title' : widget.imageNote.title!;
    _contentController.text =
        widget.imageNote.content!.isEmpty ? 'Note' : widget.imageNote.content!;
  }

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
            InvisibleTextField(
              readOnly: widget.isReadOnly,
              controller: _titleController,
              textStyle: Theme.of(context).textTheme.headlineSmall,
            ),
            InvisibleTextField(
              readOnly: widget.isReadOnly,
              controller: _contentController,
              textStyle: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
