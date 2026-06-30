import 'package:flutter/material.dart';
import 'package:medical/core/utils/auth/profile_service.dart';
import 'package:medical/features/data/widgets/custom_button.dart';
import 'package:medical/features/data/widgets/custom_text_form_field.dart';
import '../../../../../core/services/snack_bar_service.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../main.dart';

class PasswordManager extends StatelessWidget {
  const PasswordManager({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigatorKey.currentState!.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColor.primary),
        ),
        title: Text(
          "password manager",
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
              SizedBox(height: 40),
              Text(
                "Current Password",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: AppColor.black,
                ),
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                width: double.infinity,
                isPassword: true,
                hintText: "*************",
                controller: ProfileService.currentPasswordController,
              ),
              SizedBox(height: 30),
              Text(
                "New Password",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: AppColor.black,
                ),
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                width: double.infinity,
                isPassword: true,
                hintText: "*************",
                controller: ProfileService.newPasswordController,
              ),
              SizedBox(height: 30),
              Text(
                "Confirm New Password",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: AppColor.black,
                ),
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                width: double.infinity,
                isPassword: true,
                hintText: "*************",
                controller: ProfileService.confirmPasswordController,
              ),
              SizedBox(height: 240),
              SizedBox(
                width: size.width * 0.9,
                child: CustomButton(
                  text: "Change Password",
                  buttonColor: AppColor.primary,
                  textColor: AppColor.white,
                  onPressed: () async {
                    if (ProfileService.newPasswordController.text !=
                        ProfileService.confirmPasswordController.text) {
                      SnackBarService.showErrorMessage(
                        "Passwords do not match",
                      );
                      return;
                    }

                    await ProfileService.updatePassword();

                    SnackBarService.showSuccessMessage(
                      "Password changed successfully",
                    );

                    navigatorKey.currentState!.pop();
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
