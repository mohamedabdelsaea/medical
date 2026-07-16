import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medical/core/theme/app_color.dart';

import 'image_packer_bottom_sheet.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    required this.profileImage,
    required this.imageUrl,
    required this.onImageSelected,
  });

  final File? profileImage;
  final String? imageUrl;
  final ValueChanged<File> onImageSelected;

  Future<void> _pickImage(BuildContext context) async {
    final image = await ImagePickerBottomSheet.show(context);

    if (image != null) {
      onImageSelected(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (profileImage != null) {
      imageWidget = Image.file(
        profileImage!,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      imageWidget = Image.network(
        imageUrl!,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            "assets/image/profile.png",
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return SizedBox(
            width: 100,
            height: 100,
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
      );
    } else {
      imageWidget = Image.asset(
        "assets/image/profile.png",
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    }

    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipOval(
            child: imageWidget,
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