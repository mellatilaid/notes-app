import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  ImageHelper({
    ImagePicker? imagePicker,
    ImageCropper? imageCrop,
  })  : _imagePicker = imagePicker ?? ImagePicker(),
        _imageCroper = imageCrop ?? ImageCropper();

  final ImagePicker _imagePicker;
  final ImageCropper _imageCroper;

  Future<XFile?> pickImage(
      {required ImageSource source, int imageQuilty = 100}) async {
    try {
      final pickedImage = await _imagePicker.pickImage(
          source: source, imageQuality: imageQuilty);
      if (pickedImage != null) {
        return pickedImage;
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      print('Failed to pick image ${e.toString()}');
    }
    return null;
  }

  Future<CroppedFile?> cropImage(
      {required String sourcePath,
      CropStyle cropStyle = CropStyle.rectangle}) async {
    final croppedImage = await _imageCroper.cropImage(
      sourcePath: sourcePath,
      cropStyle: cropStyle,
      compressQuality: 100,
    );
    return croppedImage;
  }
}
