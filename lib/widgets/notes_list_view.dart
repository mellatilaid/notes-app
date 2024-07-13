import 'package:flutter/material.dart';
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
  State<NotesListview> createState() => _NotesListviewState();
}

class _NotesListviewState extends State<NotesListview>
    with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final List textNotes = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _inserToAnimatedList();
    });
  }

  _inserToAnimatedList() {
    for (var i = 0; i < widget.textNotes.length; i++) {
      textNotes.add(widget.textNotes[i]);
      listKey.currentState?.insertItem(i);
    }
  }

  final Tween<Offset> _offset =
      Tween(begin: const Offset(1, 0), end: const Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      physics: const BouncingScrollPhysics(),
      key: listKey,
      //key: UniqueKey(),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      initialItemCount: textNotes.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(_offset),
          child: NotesViewSlidableNote(
            widgetLocation: widget.widgetLocation,
            noteModel: textNotes[index],
            index: index,
          ),
        );
      },
    );
  }
}
