import 'package:aut_app/ReuseWidgets/use_button.dart';
import 'package:aut_app/ReuseWidgets/use_dropdown.dart';
import 'package:aut_app/Screens/phone_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/Logos/image.png",
              width: 56,
              height: 56,
            ),
            const SizedBox(
              height: 27,
            ),
            Text(
              "Please select your Language",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You can change the language",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6A6C7B),
                    ),
                  ),
                ),
                Text(
                  "at any time.",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6A6C7B),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const UseDropDown(
              list: [
                DropdownMenuEntry(value: String, label: "English"),
                DropdownMenuEntry(value: String, label: "Hindi")
              ],
              hinttext: "English",
            ),
            const SizedBox(
              height: 25,
            ),
            UseButton(
              ontap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PhoneAuth(),
                ));
              },
              text: "NEXT",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            'assets/Background/Vector1.png',
            height: 112.66,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/Background/Vector.png',
            height: 112.89,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
