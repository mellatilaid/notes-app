import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/add_voice_note_cubit/add_voice_note_cubit.dart';
import 'package:note_app/helper/formate_time.dart';
import 'package:note_app/helper/local_file_manager.dart';
import 'package:note_app/models/voice_note_model.dart';
import 'package:note_app/widgets/custom_rounded_icon.dart';
import 'package:note_app/widgets/dual_action_text_field.dart';
import 'package:permission_handler/permission_handler.dart';

import '../helper/assemble_note_helper.dart';

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
    _voiceNotetitle.text = '';
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

  Future record() async {
    if (!isRecorderReady) return;
    final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    final tempFilePath = 'audio_$timeStamp.aac';
    await recorder.startRecorder(
      toFile: tempFilePath,
    );

    isRecording = true;
  }

  Future stop() async {
    if (!isRecorderReady) return;
    audioFilePath = await recorder.stopRecorder();
    isRecording = false;
  }

  @override
  void dispose() {
    super.dispose();
    recorder.closeRecorder();
    _voiceNotetitle.dispose();
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
                  //reset audioFilePath to null when closing the bottom sheet
                  audioFilePath = null;
                },
                icon: const Icon(Icons.cancel),
              ),
              CustomRoundedIcon(
                icon: isRecording ? Icons.stop : Icons.play_arrow,
                size: 65,
                onTap: () async {
                  if (recorder.isRecording) {
                    await stop();
                  } else {
                    await record();
                  }
                  setState(() {});
                },
              ),
              IconButton(
                onPressed: () async {
                  //checking if the recoring stopped before
                  //saving or not
                  //if not stop first
                  if (isRecording) {
                    await stop();
                  }
                  if (audioFilePath != null) {
                    if (!mounted) return;
                    final AddVoiceNoteCubit addVoiceNoteCubit =
                        context.read<AddVoiceNoteCubit>();
                    _addImageNoteToTheDB(
                      addImageNoteCubit: addVoiceNoteCubit,
                      title: _voiceNotetitle.text,
                    );
                  } else {
                    if (!mounted) return;
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.done),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _addImageNoteToTheDB({
    required AddVoiceNoteCubit addImageNoteCubit,
    required String title,
  }) async {
    //save image file to local
    final String voiceLocalPath =
        await LocalFileManager(filePath: audioFilePath!).saveFileToLocal();
    //assemble the received aurgument into image note model
    final VoiceNoteModel imageNote = AssembleNote().assembleVoiceNote(
      audioPath: voiceLocalPath,
      audioTitle: title,
    );
    //add note to the hive data base
    if (!mounted) return;
    BlocProvider.of<AddVoiceNoteCubit>(context)
        .addVoiceNote(voiceNoteModel: imageNote);
  }
}
