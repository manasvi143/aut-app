import 'dart:developer';

import 'package:aut_app/ReuseWidgets/use_button.dart';
import 'package:aut_app/Screens/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController num = TextEditingController();
  String verificID = '';
  String pNumber = "";
  bool loading = false;

  Future<void> phoneCheck() async {
    setState(() {
      loading = true;
    });
    pNumber = '+91${num.text}';
    await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException ex) {
          setState(() {
            loading = false;
          });
          log(ex.toString());
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Please check the Phone Number'),
            duration: Duration(seconds: 3),
          ));
        },
        codeSent: (String verificationid, int? resendtoken) {
          verificID = verificationid;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                number: num.text.toString(),
                verificId: verificID,
                reqAgain: requestAgain,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: pNumber);

    // setState(() {
    //   loading = false;
    // });
  }

  void _ontap() async {
    await phoneCheck();
  }

  void requestAgain() {
    phoneCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.clear,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Please enter your mobile number",
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
                        "You’ll receive a 4 digit code",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6A6C7B),
                          ),
                        ),
                      ),
                      Text(
                        "to verify next.",
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
                    height: 25,
                  ),
                  SizedBox(
                    height: 48,
                    width: 327,
                    child: TextField(
                      controller: num,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/Logos/IndiaFlag.png',
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '+91   -    ',
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        hintText: 'Mobile Number',
                        hintStyle: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 48,
                      width: 327,
                      child: UseButton(ontap: _ontap, text: "CONTINUE"))
                ],
              ),
      ),
      bottomNavigationBar: Image.asset(
        "assets/Background/Group 31.png",
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
