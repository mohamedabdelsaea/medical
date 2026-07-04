import 'package:flutter/material.dart';
import 'package:medical/core/utils/auth/profile_service.dart';
import 'package:medical/features/data/widgets/custom_button_sheet.dart';
import '../../../../core/route/page_route_name.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../main.dart';
import '../../../data/widgets/custom_profile_item.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigatorKey.currentState!.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColor.primary),
        ),
        title: Text(
          local!.setting,
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
            title: local.notification,
            icon: Icons.lightbulb_outline_sharp,
            routeName: PageRouteName.notSetting,
            trailing:   Icons.arrow_forward_ios_outlined,
          ),
          SizedBox(height: 30),
          CustomProfileItem(
            title: local.password,
            icon: Icons.key,
            routeName: PageRouteName.PassManager,
            trailing:   Icons.arrow_forward_ios_outlined,
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: GestureDetector(
              onTap: () {
                CustomButtonSheet.show(
                  title: local.logOut,
                  cancelText: local.cancel,
                  confirmText: local.yes,
                  context: context,
                  passwordController: passwordController,
                  onPressed: () async {
                    await ProfileService.deleteAccount(
                      currentPassword: passwordController.text.trim(),
                    );
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
                      Icons.person,
                      color: AppColor.primary,
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    local.deleteAccount,
                    style: const TextStyle(color: AppColor.black, fontSize: 20),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColor.primary,
                    size: 26,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
