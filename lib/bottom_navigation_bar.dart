import 'package:flutter/material.dart';
import 'package:note_app/views/folders_view.dart';
import 'package:note_app/views/notes_view.dart';
import 'package:note_app/views/reminders_view.dart';
import 'package:note_app/views/to_do_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
    const NotesView(),
    const FoldersView(),
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
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: const Color(0xFF6D9EBD),
        unselectedItemColor: Colors.white,
        currentIndex: _pageSelected,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.note),
            title: const Text('My Notes'),
          ),
          SalomonBottomBarItem(
              icon: const Icon(Icons.collections),
              title: const Text('My Folders')),
          SalomonBottomBarItem(
            icon: const Icon(Icons.checklist),
            title: const Text('To Do'),
          ),
          SalomonBottomBarItem(
              icon: const Icon(Icons.add_alert_rounded),
              title: const Text('Remider Me')),
        ],
      ),
    );
  }
}
