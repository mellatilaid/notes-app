import 'package:flutter/material.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/views/add_notes_view.dart';
import 'package:note_app/views/search_view.dart';
import 'package:note_app/widgets/add_image_note_bottom_sheet.dart';
import 'package:note_app/widgets/add_note_options_speed_dial.dart';
import 'package:note_app/widgets/add_voice_note_bottom_sheet.dart';
import 'package:note_app/widgets/custom_drawer.dart';
import 'package:note_app/widgets/image_notes_view_body.dart';
import 'package:note_app/widgets/text_notes_view_body.dart';
import 'package:note_app/widgets/voice_notes_view_body.dart';

import '../helper/custom_action_speed_dial.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView>
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
                context.toView(const SearchView());
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
        drawer: const CustomDrawer(),
        body: TabBarView(
          controller: _tabBarController,
          children: const [
            TextNotesViewBody(),
            VoiceNotesViewBody(),
            ImageNotesViewBody(),
          ],
        ),
        floatingActionButton: FloatingAddOptionsSpeedDial(
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
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return AddImageNoteBottomSheet(
                        imageTabController: _tabBarController,
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
