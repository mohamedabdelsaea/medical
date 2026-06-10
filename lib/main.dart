import 'package:flutter/material.dart';
import 'package:medical/core/route/app_routes.dart';
import 'package:medical/core/route/page_route_name.dart';
import 'package:medical/core/theme/app_theme.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: PageRouteName.initial,
      theme: AppTheme.lightTheme,
    );
  }
}
