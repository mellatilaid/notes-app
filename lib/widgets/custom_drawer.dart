import 'package:feedback_sentry/feedback_sentry.dart';
import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';

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
            accountName: Text("John Doe"),
            accountEmail: Text("johndoe@example.com"),
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
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text("Share app"),
            onTap: () {
              // Handle navigation here
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.feed),
            title: const Text("Report issue or feedback"),
            onTap: () {
              BetterFeedback.of(context).showAndUploadToSentry();
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About app"),
            onTap: () {
              // Handle navigation here
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.stacked_line_chart),
            title: const Text("Version 1.0.0"),
            onTap: () {
              // Handle navigation here
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
