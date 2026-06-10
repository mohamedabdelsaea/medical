import 'package:flutter/material.dart';
import 'package:medical/core/theme/app_color.dart';
import 'package:medical/main.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          navigatorKey.currentState!.pop();
        }, icon: Icon(Icons.arrow_back_ios_new,color: AppColor.primary,)),
      ),
      body: Column(),
    );
  }
}
