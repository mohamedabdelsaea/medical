import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../features/data/model/auth_model.dart';

class ProfileService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> updateProfile({
    required String name,
    required String phone,
    required String birthDate,
  }) async {
    final user = _auth.currentUser!;

    await user.updateDisplayName(name);

    await _firestore.collection('users').doc(user.uid).update({
      'name': name,
      'phone': phone,
      'birthDate': birthDate,
    });
  }

  static Future<void> updateImage(String imageUrl) async {
    final user = _auth.currentUser!;

    await user.updatePhotoURL(imageUrl);

    await _firestore.collection('users').doc(user.uid).update({
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

    await _firestore.collection('users').doc(user.uid).update({
      'email': newEmail,
    });
  }

  static Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final user = _auth.currentUser!;

    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword,
    );

    await user.reauthenticateWithCredential(credential);

    await user.updatePassword(newPassword);
  }

  static Future<AuthModel?> getProfile() async {
    final user = _auth.currentUser;

    if (user == null) return null;

    final doc = await _firestore.collection('users').doc(user.uid).get();

    if (!doc.exists) return null;

    return AuthModel.fromJson(doc.data()!);
  }
}
