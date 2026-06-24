import 'package:flutter/material.dart';
import 'package:medical/core/route/page_route_name.dart';
import 'package:medical/core/theme/app_color.dart';
import 'package:medical/core/utils/auth/auth_fire_base.dart';
import 'package:medical/features/data/widgets/custom_button.dart';
import 'package:medical/features/data/widgets/custom_text_form_field.dart';
import 'package:medical/main.dart';

import '../../../../l10n/app_localizations.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigatorKey.currentState!.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColor.primary),
        ),
        title: Text(
          local!.logIn,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  local.welcome,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  local.email,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  width: size.width * 0.9,
                  isPassword: false,
                  hintText: "Enter Your Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return "Invalid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                Text(
                  local.password,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  width: size.width * 0.9,
                  isPassword: true,
                  hintText: "************",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      navigatorKey.currentState!.pushNamed(
                        PageRouteName.forgetPassword,
                      );
                    },
                    child: Text(
                      "Forget Password",
                      style: TextStyle(color: AppColor.primary),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    text: local.logIn,
                    buttonColor: AppColor.primary,
                    textColor: AppColor.white,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        AuthFireBase.login().then((value) {
                          if (value) {
                            navigatorKey.currentState!.pushNamedAndRemoveUntil(
                              PageRouteName.layout,
                              (route) => false,
                            );
                          }
                        });
                      }
                    },
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Text("Or Sign In With"),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColor.gray,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset("assets/image/google.png"),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColor.gray,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset("assets/image/facebook.png"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account?"),
                    TextButton(
                      onPressed: () {
                        navigatorKey.currentState!.pushNamed(
                          PageRouteName.signUp,
                        );
                      },
                      child: Text(
                        local.signUp,
                        style: TextStyle(color: AppColor.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
