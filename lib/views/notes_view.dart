import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/views/add_notes_view.dart';
import 'package:note_app/views/search_notes_view.dart';
import 'package:note_app/widgets/add_note_options_speed_dial.dart';
import 'package:note_app/widgets/add_voice_note_bottom_sheet.dart';
import 'package:note_app/widgets/text_notes_view_body.dart';
import 'package:note_app/widgets/voice_notes_view_body.dart';

class MyNotesView extends StatefulWidget {
  const MyNotesView({super.key});

  @override
  State<MyNotesView> createState() => _MyNotesViewState();
}

class _MyNotesViewState extends State<MyNotesView>
    with SingleTickerProviderStateMixin {
  late final _tabBarController = TabController(length: 3, vsync: this);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabBarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: const Text('My Notes'),
          actions: [
            IconButton(
              onPressed: () {
                context.toView(const SearchNotesView());
              },
              icon: const Icon(Icons.search),
            ),
          ],
          bottom: TabBar(
              controller: _tabBarController,
              labelColor: kPrimaryColor,
              dividerColor: kPrimaryColor,
              tabs: const [
                Icon(Icons.text_fields),
                Icon(Icons.mic),
                Icon(Icons.image),
              ]),
        ),
        drawer: const Drawer(),
        body: TabBarView(
          controller: _tabBarController,
          children: const [
            TextNotesViewBody(),
            VoiceNotesViewBody(),
            Text('mellati'),
          ],
        ),
        floatingActionButton: AddNoteOptionsSpeedDial(
          speedDials: [
            customSpeedDialChild(
                onTap: () => context.toView(AddNotesView(
                      textNoteTabController: _tabBarController,
                    )),
                icon: const Icon(Icons.text_fields),
                label: 'Add Text'),
            customSpeedDialChild(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return AddVoiceNoteBottomSheet(
                        voiceTabController: _tabBarController,
                      );
                    });
              },
              icon: const Icon(Icons.mic),
              label: 'Add Voice',
            ),
            customSpeedDialChild(
              icon: const Icon(Icons.image),
              label: 'Add Image',
            ),
          ],
        ),
      ),
    );
  }

  SpeedDialChild customSpeedDialChild(
      {required Icon icon, required String label, VoidCallback? onTap}) {
    return SpeedDialChild(
      child: icon,
      // The background color of the mini FAB
      backgroundColor: Colors.grey.withOpacity(0.6),
      // The foreground color of the mini FAB
      foregroundColor: Colors.white,
      // The label of the mini FAB
      label: label,
      // The action to perform when the mini FAB is tapped
      onTap: onTap,
    );
  }
}
