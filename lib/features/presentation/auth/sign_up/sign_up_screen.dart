import 'package:flutter/material.dart';
import 'package:medical/core/utils/auth/auth_fire_base.dart';
import 'package:medical/features/data/widgets/custom_button.dart';
import '../../../../core/route/page_route_name.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../main.dart';
import '../../../data/widgets/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    AuthFireBase.clearControllers();
    super.dispose();
  }

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
          local!.newAccount,
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  local.fullName,
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
                  controller: AuthFireBase.nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your Full Name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
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
                  controller: AuthFireBase.passwordController,
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
                  controller: AuthFireBase.emailController,
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
                SizedBox(height: 10),
                Text(
                  local.phone,
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
                  hintText: local.phone,
                  controller: AuthFireBase.phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter phone number";
                    }
                    if (value.length != 11) {
                      return "Phone number must be 11 digits";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.numberWithOptions(),
                ),
                SizedBox(height: 10),
                Text(
                  local.dateOfBirth,
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
                  controller: AuthFireBase.birthDateController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your BirthDate";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    text: local.signUp,
                    buttonColor: AppColor.primary,
                    textColor: AppColor.white,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        AuthFireBase.createAccount().then((value) {
                          if (value == true) {
                            navigatorKey.currentState!.pushNamedAndRemoveUntil(
                              PageRouteName.signIn,
                              (route) => false,
                            );
                          }
                        });
                      }
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
                        navigatorKey.currentState!.pushNamed(
                          PageRouteName.signIn,
                        );
                      },
                      child: Text(
                        local.logIn,
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
