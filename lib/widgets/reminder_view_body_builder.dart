import 'package:flutter/material.dart';

class RemindersViewBodyBuilder extends StatelessWidget {
  const RemindersViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class RemindersListView extends StatelessWidget {
  const RemindersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Placeholder();
      },
    );
  }
}
