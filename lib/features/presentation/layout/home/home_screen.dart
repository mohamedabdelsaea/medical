import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical/core/route/page_route_name.dart';
import 'package:medical/core/theme/app_color.dart';
import 'package:medical/features/data/widgets/custom_app_bar.dart';
import 'package:medical/features/data/widgets/custom_home_list.dart';
import 'package:medical/features/domain/manager/home_cubit.dart';
import 'package:medical/main.dart';

import '../../../../l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var doctor = HomeCubit.get(context).doctorList;
    var local = AppLocalizations.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            expandedHeight: 80,
            flexibleSpace: SafeArea(child: CustomAppBar()),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigatorKey.currentState!.pushNamed(
                                PageRouteName.doctor,
                              );
                            },
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.stethoscope,
                                    color: AppColor.primary,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    local!.doctor,
                                    style: TextStyle(color: AppColor.primary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              navigatorKey.currentState!.pushNamed(
                                PageRouteName.favourite,
                              );
                            },
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    color: AppColor.primary,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    local.favourite,
                                    style: TextStyle(color: AppColor.primary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                      SizedBox(height: 10),
                      EasyDateTimeLine(
                        initialDate: selectedDate,
                        activeColor: AppColor.primary,
                        onDateChange: (date) {
                          setState(() {
                            selectedDate = date;
                          });
                        },
                      ),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CustomHomeList(currentIndex: index);
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20),
                        itemCount: doctor.length,
                      ),
                      SizedBox(height: 20),
                    ],
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
