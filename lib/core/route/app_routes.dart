import 'package:flutter/material.dart';
import 'package:medical/core/route/page_route_name.dart';
import 'package:medical/features/presentation/auth/forget_password/forget_password.dart';
import 'package:medical/features/presentation/auth/sign_in/sign_in_screen.dart';
import 'package:medical/features/presentation/auth/sign_up/sign_up_screen.dart';
import 'package:medical/features/presentation/layout/home/home_screen.dart';
import 'package:medical/features/presentation/layout/layout_screen.dart';
import 'package:medical/features/presentation/splash/splash_screen.dart';
import 'package:medical/features/presentation/welcome/welcome_screen.dart';

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

      default:
        return MaterialPageRoute(builder: (context) => SplashScreen());
    }
  }
}
