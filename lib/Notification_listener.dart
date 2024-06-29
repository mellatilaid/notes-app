import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:note_app/bottom_navigation_bar.dart';

import 'services/local_notifications_service.dart';

class NotificationsListener extends StatefulWidget {
  final Widget child;

  const NotificationsListener({super.key, required this.child});
  static final GlobalKey<BottomNavPageState> mainScreenKey =
      GlobalKey<BottomNavPageState>();
  @override
  _NotificationsListenerState createState() => _NotificationsListenerState();
}

class _NotificationsListenerState extends State<NotificationsListener> {
  @override
  void initState() {
    super.initState();
    LocalNotifications.onNotifications.listen((payload) {
      _handleNotification(payload);
    });
  }

  void _handleNotification(String payload) {
    Map<String, dynamic> data = jsonDecode(payload);

    String screen = data['screen'];
    int tabIndex = screen == 'tasks' ? 2 : 3; // 2 for tasks, 3 for reminders
    NotificationsListener.mainScreenKey.currentState?.selecTab(tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
