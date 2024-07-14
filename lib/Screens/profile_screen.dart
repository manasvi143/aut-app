import 'package:aut_app/ReuseWidgets/use_button.dart';
import 'package:aut_app/ReuseWidgets/use_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool check1 = false , check2 = false;
    void ontap1() {
      setState(() {
        check1 = !check1;
        check2 = false;
      });
    }
    void ontap2() {
      setState(() {
        check2 = !check2;
        check1 = false;
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Please select your profile",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              children: [
                UseProfile(
                  check: check1,
                    descrip:
                        "Lorem ipsum dolor sit amet,\nconsectetur adipiscing",
                    title: 'Shipper',
                    image: 'assets/Logos/Group.png',
                    ontap: ontap1),
                const SizedBox(
                  height: 25,
                ),
                UseProfile(
                  check: check2,
                    descrip:
                        "Lorem ipsum dolor sit amet,\nconsectetur adipiscing",
                    title: 'Transporter',
                    image: 'assets/Logos/Group1.png',
                    ontap: ontap2),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
              width: 328,
              height: 56,
              child: UseButton(ontap: () {}, text: "CONTINUE")),
        ],
      ),
    );
  }
}
