import 'dart:io';
import 'package:flutter/material.dart';
import 'package:medical/core/services/snack_bar_service.dart';
import 'package:medical/features/domain/manager/profile_cubit/profile_cubit.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/utils/auth/auth_fire_base.dart';
import '../../../../core/utils/auth/profile_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../main.dart';
import '../../../data/image_packer/custom_profile_image.dart';
import '../../../data/widgets/custom_button.dart';
import '../../../data/widgets/custom_text_form_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? profileImage;
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profile = await ProfileService.getProfile();

    if (profile == null) return;

    imageUrl = profile.image;

    AuthFireBase.nameController.text = profile.name!;
    AuthFireBase.phoneController.text = profile.phone!;
    AuthFireBase.emailController.text = profile.email!;
    AuthFireBase.birthDateController.text = profile.birthDate!;

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigatorKey.currentState!.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.primary,
          ),
        ),
        title: Text(
          local!.updateProfile,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomProfileImage(
                profileImage: profileImage,
                imageUrl: imageUrl,
                onImageSelected: (image) async {
                  final profileCubit = ProfileCubit.get(context);

                  setState(() {
                    profileImage = image;
                  });

                  final url = await ProfileService.uploadProfileImage(image);

                  if (!mounted) return;

                  await profileCubit.loadProfile();

                  setState(() {
                    imageUrl = url;
                  });
                },
              ),
              const SizedBox(height: 10),
              Text(
                local.fullName,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                width: size.width * 0.9,
                isPassword: false,
                hintText: "Enter Your Full Name",
                controller: AuthFireBase.nameController,
              ),
              const SizedBox(height: 10),
              Text(
                local.phone,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                width: size.width * 0.9,
                isPassword: false,
                hintText: "+20112233456",
                controller: AuthFireBase.phoneController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              Text(
                local.email,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                width: size.width * 0.9,
                isPassword: false,
                hintText: "Enter Your Email",
                controller: AuthFireBase.emailController,
              ),
              const SizedBox(height: 10),
              Text(
                local.dateOfBirth,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                width: size.width * 0.9,
                isPassword: false,
                hintText: "DD / MM / YYYY",
                controller: AuthFireBase.birthDateController,
              ),
              SizedBox(height: size.height * 0.1),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  text: local.updateProfile,
                  buttonColor: AppColor.primary,
                  textColor: AppColor.white,
                  onPressed: () async {
                    final profileCubit = ProfileCubit.get(context);

                    await ProfileService.updateProfile(
                      name: AuthFireBase.nameController.text.trim(),
                      phone: AuthFireBase.phoneController.text.trim(),
                      birthDate: AuthFireBase.birthDateController.text.trim(),
                    );

                    if (!mounted) return;

                    await profileCubit.loadProfile();

                    navigatorKey.currentState!.pop();

                    SnackBarService.showSuccessMessage(
                      "Profile Updated Successfully",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}