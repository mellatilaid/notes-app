import 'package:flutter/material.dart';

import 'image_notes_list_view.dart';

class ImageNotesViewBody extends StatelessWidget {
  const ImageNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImageNotesViewBuilder();
  }
}

class ImageNotesViewBuilder extends StatelessWidget {
  const ImageNotesViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImageNotesListView();
  }
}

class CustomListTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final Widget trailing;
  final double height;

  const CustomListTile({
    Key? key,
    required this.leading,
    required this.title,
    required this.trailing,
    this.height = 80.0, // Default height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: height,
        child: Row(
          children: <Widget>[
            // Leading Widget
            Container(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: leading,
              ),
            ),
            // Title Widget
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'note date',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
