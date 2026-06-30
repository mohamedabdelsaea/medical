import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medical/core/theme/app_color.dart';
import 'image_packer_bottom_sheet.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    required this.profileImage,
    required this.onImageSelected,
  });

  final File? profileImage;
  final ValueChanged<File> onImageSelected;

  Future<void> _pickImage(BuildContext context) async {
    final image = await ImagePickerBottomSheet.show(context);

    if (image != null) {
      onImageSelected(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipOval(
            child: profileImage != null
                ? Image.file(
              profileImage!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
                : Image.asset(
              "assets/image/profile.png",
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => _pickImage(context),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColor.white,
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.edit,
                  color: AppColor.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}