import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medical/features/data/model/auth_model.dart';
import '../../services/snack_bar_service.dart';
import '../../services/web_service.dart';

class AuthGmailAndFaceBook {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static Future<void> _saveUser(User user) async {
    final authModel = AuthModel(
      uid: user.uid,
      name: user.displayName ,
      email: user.email ,
      phone: user.phoneNumber ,
      birthDate: '',
      image: user.photoURL,
    );

    await _fireStore.collection('users').doc(user.uid).set({
      ...authModel.toJson(),
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    final String? token = await user.getIdToken();

    await WebServices().setMobileToken(token);
    await WebServices().initializeToken();
  }

  static Future<bool> signInWithGoogle() async {
    try {
      EasyLoading.show();

      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize();

      final GoogleSignInAccount googleUser =
      await googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth =
          googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      await _saveUser(userCredential.user!);

      EasyLoading.dismiss();

      SnackBarService.showSuccessMessage("Google Login Successfully");

      return true;
    } on GoogleSignInException catch (e) {
      EasyLoading.dismiss();

      SnackBarService.showErrorMessage(e.toString());

      return false;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();

      SnackBarService.showErrorMessage(
        e.message ?? "Google Sign In Failed",
      );

      return false;
    } catch (e) {
      EasyLoading.dismiss();

      log(e.toString());

      SnackBarService.showErrorMessage("Unexpected error occurred");

      return false;
    }
  }

  static Future<bool> signInWithFacebook() async {
    try {
      EasyLoading.show();

      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.cancelled) {
        EasyLoading.dismiss();
        SnackBarService.showErrorMessage("Login cancelled");
        return false;
      }

      if (loginResult.status != LoginStatus.success) {
        EasyLoading.dismiss();
        SnackBarService.showErrorMessage("Facebook Sign In Failed");
        return false;
      }

      final OAuthCredential credential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      await _saveUser(userCredential.user!);

      EasyLoading.dismiss();

      SnackBarService.showSuccessMessage("Facebook Login Successfully");

      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();

      SnackBarService.showErrorMessage(
        e.message ?? "Facebook Sign In Failed",
      );

      return false;
    } catch (e) {
      EasyLoading.dismiss();

      log(e.toString());

      SnackBarService.showErrorMessage("Unexpected error occurred");

      return false;
    }
  }
}