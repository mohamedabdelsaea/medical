import 'package:flutter/material.dart';
import 'package:medical/core/route/page_route_name.dart';
import 'package:medical/core/theme/app_color.dart';
import 'package:medical/features/data/widgets/custom_app_bar.dart';
import 'package:medical/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(children: []),
    );
  }
}
