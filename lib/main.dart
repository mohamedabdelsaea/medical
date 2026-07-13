import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medical/core/route/app_routes.dart';
import 'package:medical/core/route/page_route_name.dart';
import 'package:medical/core/theme/app_theme.dart';
import 'package:medical/features/domain/manager/home_cubit.dart';
import 'core/services/web_service.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await WebServices().initializeToken();
  runApp(BlocProvider(create: (context) => HomeCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: PageRouteName.initial,
          theme: AppTheme.lightTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: HomeCubit.get(context).locale,
          builder: EasyLoading.init(builder: BotToastInit()),
        );
      },
    );
  }
}
