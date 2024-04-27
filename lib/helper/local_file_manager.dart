import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class LocalFileManager {
  final String filePath;
  const LocalFileManager({required this.filePath});

  saveFileToLocal() async {
    final File file = File(filePath);
    //get the application document directory
    final directory = await getApplicationDocumentsDirectory();
    //create a unique name for the file to be saved
    final fileName = path.basename(filePath);
    //copy the file to app's local directory
    final localFilePath = path.join(directory.path, fileName);
    final localFile = await file.copy(localFilePath);
    //return the local saved file path
    return localFile.path;
  }

  removeFileFromLocal() async {
    final File file = File(filePath);
    try {
      if (await file.exists()) {
        await file.delete();
      } else {
        print('file does not exist');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
