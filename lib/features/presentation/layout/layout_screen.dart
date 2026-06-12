import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/core/theme/app_color.dart';
import 'package:medical/features/domain/manager/home_cubit.dart';
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
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primary,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      cubit.changeIndex(0);
                    },
                    icon: Icon(
                      size: 30,
                      Icons.home_sharp,
                      color: cubit.selectedIndex == 0
                          ? AppColor.white
                          : AppColor.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.changeIndex(1);
                    },
                    icon: Icon(
                      size: 30,
                      Icons.chat,
                      color: cubit.selectedIndex == 1
                          ? AppColor.white
                          : AppColor.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.changeIndex(2);
                    },
                    icon: Icon(
                      size: 30,
                      Icons.person,
                      color: cubit.selectedIndex == 2
                          ? AppColor.white
                          : AppColor.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.changeIndex(3);
                    },
                    icon: Icon(
                      size: 30,
                      Icons.calendar_month_outlined,
                      color: cubit.selectedIndex == 3
                          ? AppColor.white
                          : AppColor.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: taps[cubit.selectedIndex],
        );
      },
    );
  }
}
