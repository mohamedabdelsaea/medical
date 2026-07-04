import 'package:flutter/material.dart';
import 'package:medical/core/route/page_route_name.dart';
import 'package:medical/core/utils/auth/auth_fire_base.dart';
import 'package:medical/features/data/widgets/custom_button_sheet.dart';
import 'package:medical/features/data/widgets/custom_profile_item.dart';
import 'package:medical/main.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          local!.profile,
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
              AuthFireBase.currentName,
              style: TextStyle(color: AppColor.black, fontSize: 20),
            ),
            SizedBox(height: 30),
            CustomProfileItem(
              title: local.profile,
              icon: Icons.person,
              routeName: PageRouteName.editProfile,
              trailing:   Icons.arrow_forward_ios_outlined,
            ),
            SizedBox(height: 20),
            CustomProfileItem(
              title: local.favourite,
              icon: Icons.favorite_border,
              routeName: PageRouteName.favourite,
              trailing:   Icons.arrow_forward_ios_outlined,
            ),
            SizedBox(height: 20),
            CustomProfileItem(
              title: local.payment,
              icon: Icons.payment_outlined,
              routeName: PageRouteName.payment,
              trailing:   Icons.arrow_forward_ios_outlined,
            ),
            SizedBox(height: 20),
            CustomProfileItem(
              title: local.privacy,
              icon: Icons.privacy_tip_outlined,
              routeName: PageRouteName.privacy,
              trailing:   Icons.arrow_forward_ios_outlined,
            ),
            SizedBox(height: 20),
            CustomProfileItem(
              title: local.setting,
              icon: Icons.settings,
              routeName: PageRouteName.setting,
              trailing:   Icons.arrow_forward_ios_outlined,
            ),
            SizedBox(height: 20),
            CustomProfileItem(
              title: local.help,
              icon: Icons.help,
              routeName: PageRouteName.help,
              trailing:   Icons.arrow_forward_ios_outlined,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: GestureDetector(
                onTap: () {
                  CustomButtonSheet.show(
                    title: local.logOut,
                    cancelText: local.cancel,
                    confirmText: local.yes,
                    context: context,
                    onPressed: () {
                      AuthFireBase.logout();
                      navigatorKey.currentState!.pushNamedAndRemoveUntil(
                        PageRouteName.welcome,
                        (route) => false,
                      );
                    },
                  );
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
                      local.logOut,
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
