import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/core/res/colors.dart';

class FilledField extends StatelessWidget {
  const FilledField({super.key,this.readOnly = false, this.controller, this.prefixIcon, this.suffixIcon, this.hintText, this.keyboardType, this.style});

  final TextEditingController? controller;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? style;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16));
    return TextField(
                keyboardType: keyboardType,
                controller: controller,
                readOnly: readOnly,
                decoration: InputDecoration(
                  focusedBorder: border,
                  enabledBorder: border,
                  prefixIcon: prefixIcon,
                  filled: true,
                  fillColor: Colours.light,
                  suffixIcon: suffixIcon,
                  hintText: hintText,
                  hintStyle: style,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                ),
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colours.backgroundDark,
                    fontWeight: FontWeight.bold),
              );
  }
}