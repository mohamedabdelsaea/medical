import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AuthFireBase {
  static final _auth = FirebaseAuth.instance;

  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController phoneController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  static final TextEditingController loginEmailController =
      TextEditingController();
  static final TextEditingController loginPasswordController =
      TextEditingController();

  static Future<void> createAccount() async {
    try {
      EasyLoading.show();
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
      EasyLoading.dismiss();
    } on FirebaseException {}
  }

  static Future<void> login() async {
    try {
      EasyLoading.show();
      await _auth.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      );
      EasyLoading.dismiss();
      UserCredential user;
    } on FirebaseException {}
  }
}
