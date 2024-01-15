import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/views/add_notes_view.dart';
import 'package:note_app/views/notes_collections_view.dart';
import 'package:note_app/views/notes_view.dart';
import 'package:note_app/views/reminders_view.dart';
import 'package:note_app/views/to_do_view.dart';

class HomePageNav extends StatefulWidget {
  const HomePageNav({super.key});
  static String id = 'homePageNav';
  @override
  State<HomePageNav> createState() => _HomePageNavState();
}

class _HomePageNavState extends State<HomePageNav> {
  var _selectedIndex = 0;

  _navigatedBottmBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _page = [
    const MyNotesView(),
    const NotesCollectionsView(),
    const AddNotesView(),
    const ToDoView(),
    const RemindersView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _navigatedBottmBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Collections',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: kPrimaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'To Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add),
            label: 'Reminder',
          ),
        ],
      ),
    );
  }
}
