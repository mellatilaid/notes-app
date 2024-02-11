import 'package:flutter/material.dart';
import 'package:note_app/views/notes_collections_view.dart';
import 'package:note_app/views/notes_view.dart';
import 'package:note_app/views/reminders_view.dart';
import 'package:note_app/views/to_do_view.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});
  static String id = 'bottomNavigationPage';
  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _pageSelected = 0;
  final _pageController = PageController();

  final _pages = [
    const MyNotesView(),
    const NotesCollectionsView(),
    const ToDoView(),
    const RemindersView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _pageSelected = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _pageSelected,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 200), curve: Curves.ease);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'My Notes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections), label: 'My Folders'),
          BottomNavigationBarItem(icon: Icon(Icons.checklist), label: 'To Do'),
          BottomNavigationBarItem(
              icon: Icon(Icons.remember_me), label: 'Remider Me'),
        ],
      ),
    );
  }
}
