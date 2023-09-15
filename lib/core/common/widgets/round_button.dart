import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/core/res/colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, this.onPressed, required this.text});

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colours.light,
        minimumSize: Size(size.width * 0.82, size.height * .06),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colours.backgroundDark),
      ),
    );
  }
}
