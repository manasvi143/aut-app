import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UseButton extends StatelessWidget {
  const UseButton({super.key, required this.ontap, required this.text});
  final String text;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 216,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E3B62), // Dark blue background color
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          elevation: 0, // Shadow effect
          
        ),
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      ),
    );
  }
}
