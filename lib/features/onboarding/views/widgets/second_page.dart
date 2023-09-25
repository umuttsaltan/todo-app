import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/core/common/widgets/fading_text.dart';
import 'package:todoapp/core/common/widgets/round_button.dart';
import 'package:todoapp/core/common/widgets/white_space.dart';
import 'package:todoapp/core/res/colors.dart';
import 'package:todoapp/features/authentication/views/sign_in_screen.dart';

import '../../../../core/res/image_res.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25).copyWith(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageRes.todo),
          const WhiteSpace(
            height: 50,
          ),
          RoundButton(
            text: 'Login with phone',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const SignInScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
