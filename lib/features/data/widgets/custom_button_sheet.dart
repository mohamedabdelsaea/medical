import 'package:flutter/material.dart';
import 'package:medical/core/route/page_route_name.dart';
import 'package:medical/core/theme/app_color.dart';
import 'package:medical/main.dart';

class CustomButtonSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColor.white,
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Text(
                "Logout",
                style: TextStyle(
                  fontSize: 22,
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 14),
              Text(
                "are you sure you want to log out?",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: WidgetStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                        backgroundColor: WidgetStatePropertyAll(AppColor.gray),
                      ),
                      onPressed: () {
                        navigatorKey.currentState!.pop();
                      },
                      child: const Text(
                        "Cancel",
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
                        minimumSize: WidgetStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          AppColor.primary,
                        ),
                      ),
                      onPressed: () {
                        navigatorKey.currentState!.pushNamed(
                          PageRouteName.signIn,
                        );
                      },
                      child: const Text(
                        "Yes Logout",
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        );
      },
    );
  }
}
