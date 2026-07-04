import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical/features/data/widgets/custom_profile_item.dart';
import 'package:medical/features/data/widgets/custom_text_form_field.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../main.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        leading: IconButton(
          onPressed: () {
            navigatorKey.currentState!.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColor.white),
        ),
        title: Text(
          local!.helpCenter,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: AppColor.primary,
            child: Column(
              children: [
                Text(
                  "How can we help you?",
                  style: TextStyle(fontSize: 16, color: AppColor.gray),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  height: 50,
                  width: size.width * 0.9,
                  isPassword: false,
                  backgroundColor: AppColor.white,
                  hintText: "Search...",
                  prefixIcon: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = true;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColor.primary : AppColor.gray,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "FAQ",
                        style: TextStyle(
                          color: isSelected ? AppColor.white : AppColor.primary,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = false;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: !isSelected ? AppColor.primary : AppColor.gray,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                          color: !isSelected
                              ? AppColor.white
                              : AppColor.primary,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          Expanded(child: isSelected ? _buildFaq() : _buildContactUs()),
        ],
      ),
    );
  }

  Widget _buildFaq() {
    return SingleChildScrollView(
      child: Column(
        children: [
        ],
      ),
    );
  }

  Widget _buildContactUs() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          CustomProfileItem(
            title: "Customer Service",
            icon: Icons.headset_mic_outlined,
            trailing: Icons.keyboard_arrow_down,
          ),
          const SizedBox(height: 20),
          CustomProfileItem(
            title: "Website",
            icon: Icons.language,
            trailing: Icons.keyboard_arrow_down,
          ),
          const SizedBox(height: 20),
          CustomProfileItem(
            title: "Whatsapp",
            icon: FontAwesomeIcons.whatsapp,
            trailing: Icons.keyboard_arrow_down,
          ),
          const SizedBox(height: 20),
          CustomProfileItem(
            title: "Facebook",
            icon: FontAwesomeIcons.facebook,
            trailing: Icons.keyboard_arrow_down,
          ),
          const SizedBox(height: 20),
          CustomProfileItem(
            title: "Instagram",
            icon: FontAwesomeIcons.squareInstagram,
            trailing: Icons.keyboard_arrow_down,
          ),
        ],
      ),
    );
  }
}
