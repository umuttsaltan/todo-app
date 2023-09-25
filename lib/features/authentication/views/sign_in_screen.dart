import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todoapp/core/common/widgets/round_button.dart';
import 'package:todoapp/core/common/widgets/white_space.dart';
import 'package:todoapp/core/res/colors.dart';
import 'package:todoapp/core/res/image_res.dart';
import 'package:todoapp/core/utils/core_utils.dart';
import 'package:todoapp/features/authentication/app/country_code_provider.dart';
import 'package:todoapp/features/authentication/controller/authentication_controller.dart';
import 'package:todoapp/features/authentication/repository/authentication_repository.dart';
import 'package:todoapp/features/authentication/views/otp_verification_screen.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final border = OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16));
    final phoneController = useTextEditingController();
    final code = ref.watch(countryCodeProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            physics: const PageScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              Image.asset(ImageRes.todo),
              const WhiteSpace(
                height: 20,
              ),
              Text(
                'Please enter your number to get the verification code',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colours.light,
                    fontWeight: FontWeight.w600),
              ),
              const WhiteSpace(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
                readOnly: code == null,
                decoration: InputDecoration(
                  focusedBorder: border,
                  enabledBorder: border,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 9.0, left: 14),
                    child: GestureDetector(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            onSelect: (code) {
                              ref
                                  .read(countryCodeProvider.notifier)
                                  .changeCountry(code);
                            },
                            countryListTheme: CountryListThemeData(
                              bottomSheetHeight:
                                  MediaQuery.sizeOf(context).height * .6,
                              flagSize: 30,
                              borderRadius: BorderRadius.circular(20),
                              backgroundColor: Colours.backgroundDark,
                              textStyle: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colours.light,
                                  fontWeight: FontWeight.bold),
                              searchTextStyle: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colours.light,
                                  fontWeight: FontWeight.bold),
                              inputDecoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Search',
                                  labelStyle: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: Colours.lightGrey,
                                      fontWeight: FontWeight.bold),
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: Colours.lightGrey,
                                      fontWeight: FontWeight.bold),
                                  hintText: 'Search'),
                            ),
                          );
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(bottom: code == null ? 1.h : 6.h),
                          child: Text(
                            code == null
                                ? 'Pick Country'
                                : '${code.flagEmoji} +${code.phoneCode} ',
                            style: GoogleFonts.poppins(
                                fontSize: code == null ? 18 : 20,
                                color: code == null
                                    ? Colours.lightBlue
                                    : Colours.backgroundDark,
                                fontWeight: code == null
                                    ? FontWeight.w500
                                    : FontWeight.bold),
                          ),
                        )),
                  ),
                  filled: true,
                  fillColor: Colours.light,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                ),
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colours.backgroundDark,
                    fontWeight: FontWeight.bold),
              ),
              const WhiteSpace(
                height: 30,
              ),
              RoundButton(
                text: 'Send Code',
                onPressed: () async {
                  if (code == null) return;
                  final navigator = Navigator.of(context);
                  CoreUtil.showLoader(context);
                  await ref.read(authControllerProvider).sendOTP(
                      context: context,
                      phoneNumber: '+${code.phoneCode}${phoneController.text}');
                  navigator.pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
