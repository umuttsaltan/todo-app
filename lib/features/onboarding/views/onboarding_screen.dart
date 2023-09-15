import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todoapp/core/common/widgets/fading_text.dart';
import 'package:todoapp/core/common/widgets/white_space.dart';
import 'package:todoapp/core/res/colors.dart';
import 'package:todoapp/core/res/image_res.dart';
import 'package:todoapp/features/onboarding/views/widgets/first_page.dart';
import 'package:todoapp/features/onboarding/views/widgets/second_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.backgroundDark,
      body: SafeArea(
        child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          PageView(
            controller: pageController,
            children: const [
              FirstPage(),
              SecondPage(),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25).copyWith(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceInOut);
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Ionicons.chevron_forward_circle,
                        color: Colours.light,
                        size: 36,
                      ),
                      WhiteSpace(width: 5),
                      FadingText(
                        text: 'Skip',
                        size: 18,
                        weight: FontWeight.w500,
                        color: Colours.light,
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 2,
                  effect: WormEffect(
                      dotHeight: 12,
                      spacing: 10,
                      dotColor: Colours.yellow.withOpacity(.5),
                      activeDotColor: Colours.light),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
