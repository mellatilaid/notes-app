import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/voice_notes_cubit/voice_notes_cubit.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/voice_note_model.dart';
import 'package:note_app/widgets/custom_rounded_icon.dart';
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
  bool _isCompleted = false;
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

    audioPlayer.onPlayerComplete.listen((event) {
      if (mounted) {
        isPlaying = false;
        position = Duration.zero;
        _isCompleted = true;
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
      audioPlayer.setReleaseMode(ReleaseMode.loop);
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
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              _deleteNote();
            },
            icon: const Icon(
              Icons.delete_forever,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextField(
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              controller: _titleController,
              hintText: 'Title',
            ),
            const Spacer(
              flex: 1,
            ),
            Container(
              margin: const EdgeInsets.all(8),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/audio.png',
                  ),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Slider(
                activeColor: kPrimaryColor,
                min: 0,
                max: duration.inMicroseconds.toDouble(),
                value: position.inMicroseconds.toDouble(),
                onChanged: (value) async {
                  final postion = Duration(microseconds: value.toInt());
                  await audioPlayer.seek(postion);

                  await audioPlayer.resume();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDuration(position.inMilliseconds)),
                  Text(formatDuration(duration.inMilliseconds)),
                ],
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            CustomRoundedIcon(
              onTap: () async {
                if (isPlaying) {
                  await audioPlayer.pause();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  if (_isCompleted) {
                    await audioPlayer.seek(
                        Duration.zero); // Reset the audio position to the start
                    _isCompleted = false; // Reset the completion flag
                  }
                  await audioPlayer.resume();
                  setState(
                    () {
                      isPlaying = true;
                    },
                  );
                }
              },
              size: 60,
              icon: isPlaying ? Icons.stop : Icons.play_arrow,
            ),
            const Spacer(
              flex: 1,
            ),
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

  _deleteNote() {
    Navigator.pop(context);
    widget.voiceNote.delete();
    BlocProvider.of<VoiceNotesCubit>(context).fetchVoiceNotes();
  }
}
