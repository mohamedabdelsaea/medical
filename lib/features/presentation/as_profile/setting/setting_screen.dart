import 'package:flutter/material.dart';

import '../../../../core/route/page_route_name.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../main.dart';
import '../../../data/widgets/custom_profile_item.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
          "Setting",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          CustomProfileItem(
            title: "Notification Setting",
            icon: Icons.lightbulb_outline_sharp,
            routeName: PageRouteName.notSetting,
          ),
          SizedBox(height: 30),
          CustomProfileItem(
            title: "Password Manager",
            icon: Icons.key,
            routeName: PageRouteName.PassManager,
          ),
          SizedBox(height: 30),
          CustomProfileItem(
            title: "Delete Account",
            icon: Icons.person,
            routeName: PageRouteName.favourite,
          ),
        ],
      ),
    );
  }
}
