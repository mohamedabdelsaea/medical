import 'package:flutter/material.dart';
import 'package:medical/core/theme/app_color.dart';
import 'package:medical/main.dart';

class CustomButtonSheet {
  static void show({
    required BuildContext context,
    required VoidCallback onPressed,
    TextEditingController? passwordController,
    String title = "Logout",
    String message = "Are you sure you want to log out?",
    String confirmText = "Yes",
    String cancelText = "Cancel",
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

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Current Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
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
                        backgroundColor:
                        WidgetStatePropertyAll(AppColor.gray),
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
                        backgroundColor:
                        WidgetStatePropertyAll(AppColor.primary),
                      ),
                      onPressed: onPressed,
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