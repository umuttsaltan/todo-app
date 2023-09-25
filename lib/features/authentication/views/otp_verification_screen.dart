import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:todoapp/core/common/widgets/white_space.dart';
import 'package:todoapp/core/res/colors.dart';
import 'package:todoapp/core/res/image_res.dart';
import 'package:todoapp/core/utils/core_utils.dart';
import 'package:todoapp/features/authentication/controller/authentication_controller.dart';

class OTPVerificationScreen extends ConsumerWidget {
  const OTPVerificationScreen({required this.verificationId, super.key});

  final String verificationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              Image.asset(ImageRes.todo),
              const WhiteSpace(
                height: 26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pinput(
                    length: 6,
                    onCompleted: (pin) async {
                      final navigator = Navigator.of(context);
                      CoreUtil.showLoader(context);
                      await ref.read(authControllerProvider).verifyOTP(
                          context: context,
                          verificationId: verificationId,
                          otp: pin);
                          
                    },
                    defaultPinTheme: PinTheme(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        decoration: BoxDecoration(
                            color: Colours.light,
                            borderRadius: BorderRadius.circular(10))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
