import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/core/helper/db_helper.dart';
import 'package:todoapp/core/utils/core_utils.dart';
import 'package:todoapp/features/authentication/views/otp_verification_screen.dart';
import 'package:todoapp/features/todo/views/home_screen.dart';

final authRepoProvider =
    Provider((ref) => AuthenticationRepository(auth: FirebaseAuth.instance));

class AuthenticationRepository {
  const AuthenticationRepository({
    required this.auth,
  });

  final FirebaseAuth auth;

  Future<void> sendOTP({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) {
          auth.signInWithCredential(credential);
        },
        verificationFailed: (exception) {
          CoreUtil.showSnackBar(
              context, '${exception.code}: ${exception.message}');
        },
        codeSent: (verificationId, _) {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) =>  OTPVerificationScreen(verificationId:verificationId)));
        },
        codeAutoRetrievalTimeout: (verificationId) {});
  }

  Future<void> verifyOTP(
      {required BuildContext context,
      required String verificationId,
      required String otp}) async {
    final credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    final navigator = Navigator.of(context);
    void showSnack(message) => CoreUtil.showSnackBar(context, message);
    void showOtherErrors(message) => CoreUtil.showSnackBar(context, message);
    void showFirebaseError(message) => CoreUtil.showSnackBar(context, message);
    try {
      final userCredential = await auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        await DBHelper.createUser(isVerified: true);
        navigator.pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (_) => const HomeScreen()),
            (route) => false);
      } else {
        showSnack('Error Occurred, Failed to Sign Up User');
      }
    } on FirebaseException catch (e) {
      showFirebaseError('${e.code}: ${e.message}');
    } catch (e) {
      showOtherErrors('505: Error Ocurred, Failed to Sign Up User');
    }
  }
}
