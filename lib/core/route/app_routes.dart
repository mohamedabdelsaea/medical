import 'package:flutter/material.dart';
import 'package:medical/core/route/page_route_name.dart';
import 'package:medical/features/presentation/as_profile/help/help_screen.dart';
import 'package:medical/features/presentation/as_profile/payment/payment_screen.dart';
import 'package:medical/features/presentation/as_profile/privacy/privacy_screen.dart';
import 'package:medical/features/presentation/as_profile/setting/not_setting/notification_setting.dart';
import 'package:medical/features/presentation/as_profile/setting/pass_manager/password_manager.dart';
import 'package:medical/features/presentation/auth/forget_password/forget_password.dart';
import 'package:medical/features/presentation/auth/sign_in/sign_in_screen.dart';
import 'package:medical/features/presentation/auth/sign_up/sign_up_screen.dart';
import 'package:medical/features/presentation/doctor/doctor_screen.dart';
import 'package:medical/features/presentation/favourite/favourite_screen.dart';
import 'package:medical/features/presentation/layout/home/home_screen.dart';
import 'package:medical/features/presentation/layout/layout_screen.dart';
import 'package:medical/features/presentation/layout/profile/edit_profile.dart';
import '../../features/presentation/as_profile/notification/notification_screen.dart';
import '../../features/presentation/as_profile/setting/setting_screen.dart';
import '../../features/presentation/initial/splash/splash_screen.dart';
import '../../features/presentation/initial/welcome/welcome_screen.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case PageRouteName.welcome:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());

      case PageRouteName.signIn:
        return MaterialPageRoute(builder: (context) => SignInScreen());

      case PageRouteName.signUp:
        return MaterialPageRoute(builder: (context) => SignUpScreen());

      case PageRouteName.layout:
        return MaterialPageRoute(builder: (context) => LayoutScreen());

      case PageRouteName.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case PageRouteName.forgetPassword:
        return MaterialPageRoute(builder: (context) => ForgetPassword());

      case PageRouteName.setting:
        return MaterialPageRoute(builder: (context) => SettingScreen());

      case PageRouteName.doctor:
        return MaterialPageRoute(builder: (context) => DoctorScreen());

      case PageRouteName.favourite:
        return MaterialPageRoute(builder: (context) => FavouriteScreen());

      case PageRouteName.notification:
        return MaterialPageRoute(builder: (context) => NotificationScreen());

      case PageRouteName.editProfile:
        return MaterialPageRoute(builder: (context) => EditProfile());

      case PageRouteName.payment:
        return MaterialPageRoute(builder: (context) => PaymentScreen());

      case PageRouteName.privacy:
        return MaterialPageRoute(builder: (context) => PrivacyScreen());

      case PageRouteName.help:
        return MaterialPageRoute(builder: (context) => HelpScreen());

      case PageRouteName.PassManager:
        return MaterialPageRoute(builder: (context) => PasswordManager());

      case PageRouteName.notSetting:
        return MaterialPageRoute(builder: (context) => NotificationSetting());

      default:
        return MaterialPageRoute(builder: (context) => SplashScreen());
    }
  }
}
