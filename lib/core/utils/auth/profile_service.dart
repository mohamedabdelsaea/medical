import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../features/data/model/auth_model.dart';

class ProfileService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final CollectionReference<Map<String, dynamic>> _users =
  _firestore.collection('users');

  static final TextEditingController currentPasswordController =
  TextEditingController();

  static final TextEditingController newPasswordController =
  TextEditingController();

  static final TextEditingController confirmPasswordController =
  TextEditingController();

  static Future<AuthModel?> getProfile() async {
    final user = _auth.currentUser;

    if (user == null) return null;

    final doc = await _users.doc(user.uid).get();

    if (!doc.exists) return null;

    return AuthModel.fromJson(doc.data()!);
  }

  static Stream<AuthModel?> profileStream() {
    final user = _auth.currentUser;

    if (user == null) return Stream.value(null);

    return _users.doc(user.uid).snapshots().map((doc) {
      if (!doc.exists) return null;

      return AuthModel.fromJson(doc.data()!);
    });
  }

  static Future<void> updateProfile({
    required String name,
    required String phone,
    required String birthDate,
  }) async {
    final user = _auth.currentUser!;

    await user.updateDisplayName(name);

    await _users.doc(user.uid).update({
      'name': name,
      'phone': phone,
      'birthDate': birthDate,
    });
  }

  static Future<void> updateImage(String imageUrl) async {
    final user = _auth.currentUser!;

    await user.updatePhotoURL(imageUrl);

    await _users.doc(user.uid).update({
      'image': imageUrl,
    });
  }

  static Future<void> updateEmail({
    required String newEmail,
    required String currentPassword,
  }) async {
    final user = _auth.currentUser!;

    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword,
    );

    await user.reauthenticateWithCredential(credential);

    await user.verifyBeforeUpdateEmail(newEmail);

    await _users.doc(user.uid).update({
      'email': newEmail,
    });
  }

  static Future<void> updatePassword() async {
    final user = _auth.currentUser!;

    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPasswordController.text.trim(),
    );

    await user.reauthenticateWithCredential(credential);

    await user.updatePassword(
      newPasswordController.text.trim(),
    );

    clearPasswordControllers();
  }

  static Future<void> deleteAccount({
    required String currentPassword,
  }) async {
    final user = _auth.currentUser!;

    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword,
    );

    await user.reauthenticateWithCredential(credential);

    await _users.doc(user.uid).delete();

    await user.delete();
  }

  static void clearPasswordControllers() {
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }
}