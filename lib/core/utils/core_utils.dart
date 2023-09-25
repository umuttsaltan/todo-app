import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoreUtil {
  const CoreUtil._();
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void showLoader(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      builder: (_) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colors.lightBlueAccent,
            ),
            if (message != null)
              Text(
                '$message...',
                style: GoogleFonts.poppins(
                  color: Colors.lightBlueAccent,
                ),
              )
          ],
        ),
      ),
    );
  }
}
