import 'package:flutter/material.dart';
import 'package:medical/core/route/page_route_name.dart';
import 'package:medical/core/theme/app_color.dart';
import 'package:medical/features/data/widgets/custom_button.dart';
import 'package:medical/features/data/widgets/custom_text_form_field.dart';
import 'package:medical/main.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigatorKey.currentState!.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColor.primary),
        ),
        centerTitle: true,
        title: Text(
          "Log In",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                "Welcome",
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
                "Email",
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
              ),
              SizedBox(height: 40),
              Text(
                "Password",
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
                  text: "Log In",
                  buttonColor: AppColor.primary,
                  textColor: AppColor.white,
                  onPressed: () {
                    navigatorKey.currentState!.pushNamedAndRemoveUntil(
                      PageRouteName.layout,
                      (route) => false,
                    );
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
                      "Sign Up",
                      style: TextStyle(color: AppColor.primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
