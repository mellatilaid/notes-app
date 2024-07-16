import 'package:feedback_sentry/feedback_sentry.dart';
import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/notification_listener.dart';
import 'package:note_app/widgets/custom_list_tile.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: null,
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/image_note (2).png"),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/drawer_back_image.jpg',
                  ),
                  fit: BoxFit.cover),
              color: kPrimaryColor,
            ),
          ),
          CustomListTile(
            title: 'Notes',
            leading: Icons.note,
            onTap: () {
              Navigator.pop(context);
              NotificationsListener.mainScreenKey.currentState?.selecTab(0);
            },
          ),
          CustomListTile(
            title: 'Folders',
            leading: Icons.folder,
            onTap: () {
              Navigator.pop(context);
              NotificationsListener.mainScreenKey.currentState?.selecTab(1);
            },
          ),
          CustomListTile(
            title: 'Tasks',
            leading: Icons.task,
            onTap: () {
              Navigator.pop(context);
              NotificationsListener.mainScreenKey.currentState?.selecTab(2);
            },
          ),
          CustomListTile(
            title: 'Reminders',
            leading: Icons.alarm,
            onTap: () {
              Navigator.pop(context);
              NotificationsListener.mainScreenKey.currentState?.selecTab(3);
            },
          ),
          CustomListTile(
              title: 'Share app', leading: Icons.share, onTap: () {}),
          CustomListTile(
            title: 'Report issue or feedback',
            leading: Icons.report,
            onTap: () {
              BetterFeedback.of(context).showAndUploadToSentry();
            },
          ),
          const Spacer(),
          CustomListTile(
            title: 'Version 1.0.0',
            leading: Icons.shape_line,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
