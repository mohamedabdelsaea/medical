import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerService {
  ImagePickerService._();

  static final ImagePicker _picker = ImagePicker();

  static Future<File?> pickImage(ImageSource source) async {
    PermissionStatus permission;

    if (source == ImageSource.camera) {
      permission = await Permission.camera.request();
    } else {
      if (Platform.isIOS) {
        permission = await Permission.photos.request();
      } else {
        permission = await Permission.photos.request();

        if (!permission.isGranted) {
          permission = await Permission.storage.request();
        }
      }
    }

    if (permission.isPermanentlyDenied) {
      await openAppSettings();
      return null;
    }

    if (!permission.isGranted) {
      return null;
    }

    final XFile? image = await _picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (image == null) return null;

    return File(image.path);
  }
}
