import 'package:flutter/material.dart';
import '../../../core/route/page_route_name.dart';
import '../../../core/theme/app_color.dart';
import '../../../main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 180,
      leading: Row(
        children: [
          const SizedBox(width: 10),
          ClipOval(
            child: Image.asset(
              "assets/image/profile.png",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
           Expanded(
            child: Text(
              "Mohamed ",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: AppColor.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            navigatorKey.currentState!.pushNamed(PageRouteName.notification);
          },
          icon: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: AppColor.gray,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.notifications,
              color: AppColor.black,
              size: 20,
            ),
          ),
        ),

        IconButton(
          onPressed: () {
            navigatorKey.currentState!.pushNamed(PageRouteName.setting);
          },
          icon: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: AppColor.gray,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.settings, color: AppColor.black, size: 20),
          ),
        ),

        const SizedBox(width: 10),
      ],
    );
  }
}
