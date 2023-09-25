
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/authentication/repository/authentication_repository.dart';

final authControllerProvider = Provider((ref) =>
   AuthenticationController(ref.watch(authRepoProvider))
);

class AuthenticationController{
  const AuthenticationController(this.repository);

  final AuthenticationRepository repository;

   Future<void> sendOTP({
    required BuildContext context,
    required String phoneNumber,
  }) async {
   return repository.sendOTP(context: context, phoneNumber: phoneNumber);
  }

  Future<void> verifyOTP(
      {required BuildContext context,
      required String verificationId,
      required String otp}) async =>  repository.verifyOTP(context: context, otp: otp, verificationId: verificationId);
    
    
}