import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/helper/formate_time.dart';
import 'package:note_app/widgets/dual_action_text_field.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AddVoiceNoteBottomSheetBody extends StatefulWidget {
  const AddVoiceNoteBottomSheetBody({super.key});

  @override
  State<AddVoiceNoteBottomSheetBody> createState() =>
      _AddVoiceNoteBottomSheetBodyState();
}

class _AddVoiceNoteBottomSheetBodyState
    extends State<AddVoiceNoteBottomSheetBody> {
  final TextEditingController _voiceNotetitle = TextEditingController();
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  bool isRecording = false;
  String? audioFilePath;
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

    final appDocDir = await getApplicationDocumentsDirectory();
    audioFilePath = '${appDocDir.path}/recorded_audio.aac';
  }

  Future record() async {
    if (!isRecorderReady) return;

    await recorder.startRecorder(
      toFile: audioFilePath,
      codec: Codec.aacADTS,
    );

    isRecording = true;
  }

  Future stop() async {
    if (!isRecorderReady) return;
    final audioPath = await recorder.stopRecorder();
    isRecording = false;
    final audioFile = File(audioPath!);
    log('audio file is $audioFile');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    recorder.closeRecorder();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StreamBuilder<RecordingDisposition>(
            stream: recorder.onProgress,
            builder: (context, snopshot) {
              final duration =
                  snopshot.hasData ? snopshot.data!.duration : Duration.zero;

              return Text(
                formateTime(duration.inMilliseconds),
                style: const TextStyle(fontSize: 40),
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          DualActionTextField(
            controller: _voiceNotetitle,
            hintText: 'Enter the voice note title (optional)',
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
                  onPressed: () async {
                    if (recorder.isRecording) {
                      await stop();
                    } else {
                      await record();
                    }
                    setState(() {});
                  },
                  icon: Icon(isRecording ? Icons.pause : Icons.play_arrow),
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
