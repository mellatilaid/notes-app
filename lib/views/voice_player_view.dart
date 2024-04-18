import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:note_app/models/voice_note_model.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class VoicePlayerView extends StatefulWidget {
  final VoiceNoteModel voiceNote;
  const VoicePlayerView({
    super.key,
    required this.voiceNote,
  });

  @override
  State<VoicePlayerView> createState() => _VoicePlayerViewState();
}

class _VoicePlayerViewState extends State<VoicePlayerView> {
  late TextEditingController _titleController;
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  var duration = Duration.zero;
  var position = Duration.zero;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController(text: widget.voiceNote.title);
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration;
        });
      }
    });

    audioPlayer.onPositionChanged.listen((newPostion) {
      if (mounted) {
        setState(() {
          position = newPostion;
        });
      }
    });
  }

  setAudio() async {
    try {
      audioPlayer.setSourceUrl(widget.voiceNote.voicePath);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('voice palyer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _titleController,
              hintText: 'Title',
            ),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final postion = Duration(seconds: value.toInt());
                await audioPlayer.seek(postion);

                await audioPlayer.resume();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDuration(duration.inMilliseconds)),
                  Text(formatDuration(position.inMilliseconds)),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                  } else {
                    await audioPlayer.resume();
                  }
                },
                child: Icon(
                  isPlaying ? Icons.stop : Icons.play_arrow,
                  size: 50,
                ))
          ],
        ),
      ),
    );
  }

  String formatDuration(int milliseconds) {
    int seconds = (milliseconds / 1000).floor();
    int minutes = (seconds / 60).floor();
    int hours = (minutes / 60).floor();

    String hoursStr = (hours % 24).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}
