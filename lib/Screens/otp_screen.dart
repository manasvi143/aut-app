import 'dart:developer';

import 'package:aut_app/ReuseWidgets/use_button.dart';
import 'package:aut_app/ReuseWidgets/use_pin.dart';
import 'package:aut_app/Screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen(
      {super.key,
      required this.verificId,
      required this.number,
      required this.reqAgain});
  final String verificId, number;
  final void Function() reqAgain;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController pin = TextEditingController();
  bool loading = false;

  void _ontap() async {
    setState(() {
      loading = true;
    });
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificId, smsCode: pin.text.toString());
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        setState(() {
          loading = false;
        });
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ),
        );
      });
    } catch (e) {
      log(e.toString());
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Code is Expired'),
        duration: Duration(seconds: 3),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Verify Phone",
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
                  Text(
                    "Code is sent to ${widget.number}",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6A6C7B),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 1),
                    child: UsePin(
                      length: 6,
                      tt: pin,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn’t receive the code?",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6A6C7B),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: widget.reqAgain,
                          child: Text(
                            "Request Again",
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: 328,
                      child:
                          UseButton(ontap: _ontap, text: "VERIFY AND CONTINUE"))
                ],
              ),
      ),
      bottomNavigationBar: Image.asset(
        "assets/Background/Group3.png",
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
