import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medical/core/services/snack_bar_service.dart';
import 'package:medical/core/services/web_service.dart';
import 'package:medical/features/data/model/auth_model.dart';

class AuthFireBase {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final TextEditingController emailController = TextEditingController();

  static final TextEditingController phoneController = TextEditingController();

  static final TextEditingController nameController = TextEditingController();

  static final TextEditingController birthDateController =
      TextEditingController();

  static final TextEditingController passwordController =
      TextEditingController();

  static final TextEditingController loginEmailController =
      TextEditingController();

  static final TextEditingController loginPasswordController =
      TextEditingController();

  static User? get currentUser => _auth.currentUser;

  static bool get isLoggedIn => _auth.currentUser != null;

  static String? get currentUid => _auth.currentUser?.uid;

  static String? get currentEmail => _auth.currentUser?.email;

  static Future<bool> createAccount() async {
    EasyLoading.show();

    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      final User user = userCredential.user!;

      await user.updateDisplayName(nameController.text.trim());

      final authModel = AuthModel(
        uid: user.uid,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        birthDate: birthDateController.text.trim(),
        image: '',
      );

      await _firestore.collection('users').doc(user.uid).set({
        ...authModel.toJson(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      final String? token = await user.getIdToken();

      await WebServices().setMobileToken(token);
      await WebServices().initializeToken();

      EasyLoading.dismiss();

      SnackBarService.showSuccessMessage("Create Account Successfully");

      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();

      if (e.code == 'weak-password') {
        SnackBarService.showErrorMessage(
          e.message ?? 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        SnackBarService.showErrorMessage(
          e.message ?? 'The account already exists for that email.',
        );
      } else {
        SnackBarService.showErrorMessage(e.message ?? 'Error creating account');
      }

      return false;
    } catch (e) {
      EasyLoading.dismiss();

      log(e.toString());

      SnackBarService.showErrorMessage('Unexpected error occurred');

      return false;
    }
  }

  static Future<bool> login() async {
    try {
      EasyLoading.show();

      await _auth.signInWithEmailAndPassword(
        email: loginEmailController.text.trim(),
        password: loginPasswordController.text.trim(),
      );

      final User? user = _auth.currentUser;

      if (user != null) {
        final String? token = await user.getIdToken();

        await WebServices().setMobileToken(token);
        await WebServices().initializeToken();
      }

      EasyLoading.dismiss();

      SnackBarService.showSuccessMessage("Login Successfully");

      return true;
    } on FirebaseAuthException catch (error) {
      EasyLoading.dismiss();

      SnackBarService.showErrorMessage(error.message ?? "Login Failed");

      return false;
    } catch (error) {
      EasyLoading.dismiss();

      log(error.toString());

      SnackBarService.showErrorMessage('Unexpected error occurred');

      return false;
    }
  }

  static Future<void> refreshToken() async {
    final user = _auth.currentUser;

    if (user != null) {
      final token = await user.getIdToken(true);

      await WebServices().setMobileToken(token);
      await WebServices().initializeToken();
    }
  }

  static Future<void> logout() async {
    await WebServices().setMobileToken(null);

    await _auth.signOut();
  }

  static void clearControllers() {
    emailController.clear();
    phoneController.clear();
    nameController.clear();
    birthDateController.clear();
    passwordController.clear();
    loginEmailController.clear();
    loginPasswordController.clear();
  }
}
