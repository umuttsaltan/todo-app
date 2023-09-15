import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/core/res/colors.dart';

class FadingText extends StatelessWidget {
  const FadingText({required this.text, required this.size, required this.weight, required this.color, super.key, required this.textAlign});
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        textAlign: textAlign,
        softWrap: false,
        overflow: TextOverflow.fade,
        style: GoogleFonts.poppins(
            fontSize: size, fontWeight: weight, color: color));
  }
}
