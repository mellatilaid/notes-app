import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class LocalFileManager {
  final String filePath;
  const LocalFileManager({required this.filePath});

  Future<String> saveFileToLocal() async {
    final File file = File(filePath);
    try {
      //get the application document directory
      final directory = await getApplicationDocumentsDirectory();
      //create a unique name for the file to be saved
      final fileName = path.basename(filePath);
      //copy the file to app's local directory
      final localFilePath = path.join(directory.path, fileName);
      final localFile = await file.copy(localFilePath);
      //return the local saved file path
      return localFile.path;
    } catch (e) {
      throw Exception('Failed to save file to local ${e.toString()}');
    }
  }

  removeFileFromLocal() async {
    final File file = File(filePath);
    try {
      if (await file.exists()) {
        await file.delete();
      } else {
        if (kDebugMode) {
          debugPrint('file does not exist');
        }
      }
    } catch (e) {
      throw Exception('Failed to remove file from local ${e.toString()}');
    }
  }
}
