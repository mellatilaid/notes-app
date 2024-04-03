import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:note_app/helper/const.dart';
import 'package:permission_handler/permission_handler.dart';

class AddVoiceNoteBottomSheet extends StatefulWidget {
  const AddVoiceNoteBottomSheet({super.key});

  @override
  State<AddVoiceNoteBottomSheet> createState() =>
      _AddVoiceNoteBottomSheetState();
}

class _AddVoiceNoteBottomSheetState extends State<AddVoiceNoteBottomSheet> {
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initRecorder();
  }

  initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Microphone Permisson Not granted';
    }

    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '00:00',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel),
              ),
              CircleAvatar(
                radius: 35,
                backgroundColor: kPrimaryColor,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow),
                  iconSize: 50,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.done),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RecordVoiceActions extends StatelessWidget {
  const RecordVoiceActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.cancel),
        ),
        CircleAvatar(
          radius: 35,
          backgroundColor: kPrimaryColor,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow),
            iconSize: 50,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.done),
        ),
      ],
    );
  }
}
