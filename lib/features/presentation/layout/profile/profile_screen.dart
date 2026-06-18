import 'package:flutter/material.dart';
import 'package:medical/core/route/page_route_name.dart';
import 'package:medical/features/data/widgets/custom_button_sheet.dart';
import 'package:medical/features/data/widgets/custom_profile_item.dart';
import '../../../../core/theme/app_color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                "assets/image/profile.png",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Mohamed",
              style: TextStyle(color: AppColor.black, fontSize: 20),
            ),
            SizedBox(height: 30),
            CustomProfileItem(
              title: "Profile",
              icon: Icons.person,
              routeName: PageRouteName.editProfile,
            ),
            SizedBox(height: 20),
            CustomProfileItem(
              title: "Favourite",
              icon: Icons.favorite_border,
              routeName: PageRouteName.favourite,
            ),
            SizedBox(height: 20),
            CustomProfileItem(
              title: "Payment",
              icon: Icons.payment_outlined,
              routeName: PageRouteName.payment,
            ),
            SizedBox(height: 20),
            CustomProfileItem(
              title: "Privacy Policy",
              icon: Icons.privacy_tip_outlined,
              routeName: PageRouteName.privacy,
            ),
            SizedBox(height: 20),
            CustomProfileItem(
              title: "Setting",
              icon: Icons.settings,
              routeName: PageRouteName.setting,
            ),
            SizedBox(height: 20),
            CustomProfileItem(
              title: "Help",
              icon: Icons.help,
              routeName: PageRouteName.help,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: GestureDetector(
                onTap: () {
                  CustomButtonSheet.show(context);
                },
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColor.gray,
                      ),
                      child: Icon(
                        Icons.logout,
                        color: AppColor.primary,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "Log Out",
                      style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
