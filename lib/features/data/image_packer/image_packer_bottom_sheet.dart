import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical/core/theme/app_color.dart';
import 'image_packer_service.dart';

class ImagePickerBottomSheet {
  ImagePickerBottomSheet._();

  static Future<File?> show(BuildContext context) {
    return showModalBottomSheet<File?>(
      context: context,
      backgroundColor: AppColor.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Choose from Gallery'),
                  onTap: () async {
                    final image = await ImagePickerService.pickImage(
                      ImageSource.gallery,
                    );

                    if (context.mounted) {
                      Navigator.pop(context, image);
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: Text(
                    Platform.isIOS
                        ? 'Take Photo'
                        : 'Open Camera',
                  ),
                  onTap: () async {
                    final image = await ImagePickerService.pickImage(
                      ImageSource.camera,
                    );

                    if (context.mounted) {
                      Navigator.pop(context, image);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}