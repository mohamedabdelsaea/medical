import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';
import '../../../main.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigatorKey.currentState!.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColor.primary),
        ),
        title: Text(
          "Notification",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),

      ),
    );
  }
}
