import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:note_app/helper/slidable_enums.dart';
import 'package:note_app/widgets/notes_view_slidable_note.dart';

class NotesListview extends StatefulWidget {
  final List<dynamic> textNotes;
  final WidgetLocation widgetLocation;

  const NotesListview({
    super.key,
    required this.textNotes,
    required this.widgetLocation,
  });

  @override
  State<NotesListview> createState() => NotesListviewState();
}

class NotesListviewState extends State<NotesListview>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.textNotes.length,
        key: UniqueKey(),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: NotesViewSlidableNote(
                  widgetLocation: widget.widgetLocation,
                  noteModel: widget.textNotes[index],
                  index: index,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
