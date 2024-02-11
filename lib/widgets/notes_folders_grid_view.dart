import 'package:flutter/material.dart';

class FoldersGridView extends StatelessWidget {
  const FoldersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        //childAspectRatio: 1.6,
        crossAxisSpacing: 5,
        mainAxisSpacing: 30,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const SizedBox(
          height: 200,
          child: Card(
            child: Center(child: Text('laid')),
          ),
        );
      },
    );
  }
}
