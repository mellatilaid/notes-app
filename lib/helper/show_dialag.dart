import 'package:flutter/material.dart';

import '../widgets/simple_alert_dialag_message.dart';

Future<void> showDialogMessage(BuildContext context, String content) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialaugMessage(
        content: content,
      );
    },
  );
}
