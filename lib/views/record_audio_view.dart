import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordAudioView extends StatefulWidget {
  const RecordAudioView({super.key});

  @override
  State<RecordAudioView> createState() => _RecordAudioViewState();
}

class _RecordAudioViewState extends State<RecordAudioView> {
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  Future record() async {
    if (!isRecorderReady) return;

    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    if (!isRecorderReady) return;
    final recorderPath = await recorder.stopRecorder();
    final audioFile = File(recorderPath!);
    print('audio path is $audioFile');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initRecorder();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    recorder.closeRecorder();
  }

  initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Microphone Permisson Not granted';
    }

    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(
      const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder<RecordingDisposition>(
              stream: recorder.onProgress,
              builder: (context, snopshot) {
                final duration =
                    snopshot.hasData ? snopshot.data!.duration : Duration.zero;

                return Text(
                  '${duration.inSeconds} s',
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () async {
                if (recorder.isRecording) {
                  await stop();
                } else {
                  await record();
                }
                setState(() {});
              },
              child: Icon(
                recorder.isRecording ? Icons.stop : Icons.mic,
                size: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
