import 'package:flutter/material.dart';
import 'package:medical/core/route/page_route_name.dart';
import 'package:medical/core/theme/app_color.dart';
import 'package:medical/features/data/widgets/custom_button.dart';
import 'package:medical/main.dart';
import '../../../l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: size.height * 0.2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 30),
            child: Image.asset("assets/image/welcome.png"),
          ),
          Text(
            "The patient will be monitored, cared for,\n and everything necessary \n will be done for him/her.",
            style: TextStyle(
              color: AppColor.primary,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          SizedBox(height: size.height * 0.090),
          CustomButton(
            text: local!.logIn,
            textColor: AppColor.white,
            buttonColor: AppColor.primary,
            onPressed: () {
              navigatorKey.currentState!.pushNamed(PageRouteName.signIn);
            },
          ),
          SizedBox(height: 10),
          CustomButton(
            text: local.signUp,
            textColor: AppColor.primary,
            buttonColor: AppColor.gray,
            onPressed: () {
              navigatorKey.currentState!.pushNamed(PageRouteName.signUp);
            },
          ),
        ],
      ),
    );
  }
}
