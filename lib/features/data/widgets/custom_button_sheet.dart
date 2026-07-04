import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medical/core/services/snack_bar_service.dart';
import 'package:medical/core/theme/app_color.dart';
import 'package:medical/features/data/widgets/custom_text_form_field.dart';
import 'package:medical/main.dart';

import '../../../l10n/app_localizations.dart';


class CustomButtonSheet {
  static void show({
    required BuildContext context,
    required FutureOr<void> Function() onPressed,
    TextEditingController? passwordController,
    String title = "Logout",
    String message = "Are you sure you want to log out?",
    String confirmText = "Yes",
    String cancelText = "Cancel",
    String? loadingMessage,
    String? successMessage,
  }) {
    showModalBottomSheet(
      backgroundColor: AppColor.white,
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      builder: (context) {
        final size = MediaQuery.of(context).size;
        var local = AppLocalizations.of(context);
        return Padding(
          padding: EdgeInsets.only(
            left: 18,
            right: 18,
            top: 18,
            bottom: MediaQuery.of(context).viewInsets.bottom + 18,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),

              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15),
              ),

              if (passwordController != null) ...[
                const SizedBox(height: 20),
                CustomTextFormField(
                  width: size.width * 0.9,
                  isPassword: true,
                  controller: passwordController,
                  hintText: local!.currentPassword,
                ),
              ],

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: const WidgetStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          AppColor.gray,
                        ),
                      ),
                      onPressed: () {
                        navigatorKey.currentState!.pop();
                      },
                      child: Text(
                        cancelText,
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColor.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: const WidgetStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          AppColor.primary,
                        ),
                      ),
                      onPressed: () async {
                        navigatorKey.currentState!.pop();
                        EasyLoading.show(
                          status: loadingMessage ?? "Please wait...",
                        );

                        try {
                          await onPressed();

                          EasyLoading.dismiss();

                          if (successMessage != null &&
                              successMessage.isNotEmpty) {
                            SnackBarService.showSuccessMessage(
                              successMessage,
                            );
                          }
                        } catch (e) {
                          EasyLoading.dismiss();

                          SnackBarService.showErrorMessage(
                            e.toString(),
                          );
                        }
                      },
                      child: Text(
                        confirmText,
                        style: const TextStyle(
                          fontSize: 22,
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}