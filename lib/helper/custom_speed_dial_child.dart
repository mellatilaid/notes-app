import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

SpeedDialChild customSpeedDialChild(
    {required Icon icon, required String label, VoidCallback? onTap}) {
  return SpeedDialChild(
    child: icon,
    // The background color of the mini FAB
    backgroundColor: Colors.grey.withOpacity(0.6),
    // The foreground color of the mini FAB
    foregroundColor: Colors.white,
    // The label of the mini FAB
    label: label,
    // The action to perform when the mini FAB is tapped
    onTap: onTap,
  );
}
