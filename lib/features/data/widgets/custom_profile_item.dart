import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({
    super.key,
    required this.title,
    required this.icon,
    required this.trailing,
    this.routeName,
  });

  final String title;
  final IconData icon;
  final IconData trailing;
  final String? routeName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: GestureDetector(
        onTap: () {
          if (routeName != null) {
            Navigator.pushNamed(context, routeName!);
          }
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
                icon,
                color: AppColor.primary,
                size: 26,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                color: AppColor.black,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Icon(
              trailing,
              color: AppColor.primary,
              size: 22,
               fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}