import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/core/common/widgets/fading_text.dart';
import 'package:todoapp/core/common/widgets/white_space.dart';
import 'package:todoapp/core/res/colors.dart';

import '../../../../core/res/image_res.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25)
                    .copyWith(bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Image.asset(ImageRes.todo),
                    ),
                    const WhiteSpace(height: 70),
                    const FadingText(
                        text: 'ToDo with Riverpod',
                        size: 30,
                        weight: FontWeight.w600,
                        color: Colours.light,
                        textAlign: TextAlign.center),
                    const WhiteSpace(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Welcome! Do you want to clear tasks super fast with ToDo?',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colours.lightGrey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              );
  }
}