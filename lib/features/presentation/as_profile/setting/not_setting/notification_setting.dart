import 'package:flutter/material.dart';
import 'package:medical/features/data/widgets/custom_switch.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../main.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool isOn = false;

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
          "Notification Setting",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          CustomSwitch(title: "General Notification"),
          SizedBox(height: 30),
          CustomSwitch(title: "Sound"),
          SizedBox(height: 30),
          CustomSwitch(title: "Sound Call"),
          SizedBox(height: 30),
          CustomSwitch(title: "Vibrate"),
          SizedBox(height: 30),
          CustomSwitch(title: "Special Offers"),
          SizedBox(height: 30),
          CustomSwitch(title: "Payments"),
          SizedBox(height: 30),
          CustomSwitch(title: "Cashback"),
        ],
      ),
    );
  }
}
