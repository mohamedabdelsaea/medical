import 'package:flutter/material.dart';
import 'package:medical/core/theme/app_color.dart';
import 'package:medical/features/presentation/layout/calender/calender_screen.dart';
import 'package:medical/features/presentation/layout/chat/chat_screen.dart';
import 'package:medical/features/presentation/layout/home/home_screen.dart';
import 'package:medical/features/presentation/layout/profile/profile_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;

  List<Widget> taps = [
    const HomeScreen(),
    const ChatScreen(),
    const ProfileScreen(),
    const CalenderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.primary,
        fixedColor: AppColor.white,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            value = selectedIndex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: "Calender",
          ),
        ],
      ),
      body: taps[selectedIndex],
    );
  }
}
