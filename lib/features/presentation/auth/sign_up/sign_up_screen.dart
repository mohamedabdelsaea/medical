import 'package:flutter/material.dart';
import 'package:medical/features/data/widgets/custom_button.dart';

import '../../../../core/route/page_route_name.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../main.dart';
import '../../../data/widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
          "New Account",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Full Name",
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
                hintText: "Enter Your Full Name",
              ),
              SizedBox(height: 10),
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
              SizedBox(height: 10),
              Text(
                "Phone",
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
                hintText: "Phone",
                keyboardType: TextInputType.numberWithOptions(),
              ),
              SizedBox(height: 10),
              Text(
                "Date Of Birth",
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
                hintText: "DD / MM / YYYY",
              ),
              SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  text: "Sign Up",
                  buttonColor: AppColor.primary,
                  textColor: AppColor.white,
                  onPressed: () {
                    navigatorKey.currentState!.pushNamed(PageRouteName.signIn);
                  },
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("already have an account?"),
                  TextButton(
                    onPressed: () {
                      navigatorKey.currentState!.pushNamed(PageRouteName.signIn);
                    },
                    child: Text(
                      "Log In ",
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
