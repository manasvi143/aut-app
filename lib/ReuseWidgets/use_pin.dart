import 'package:aut_app/extras/sms_retriever.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';

class UsePin extends StatefulWidget {
  const UsePin({super.key , required this.length , required this.tt});
final int length;
final TextEditingController tt;
  @override
  State<UsePin> createState() => _UsePinState();
}

class _UsePinState extends State<UsePin> {

   late final SmsRetrieverImpl smsRetrieverImpl;

  @override
  void initState() {
    smsRetrieverImpl = SmsRetrieverImpl(SmartAuth());
    super.initState();
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: Color(0xFF93D2F3),
      border: Border.all(color: Color(0xFF93D2F3)),
      borderRadius: BorderRadius.zero,
    ),
  );

  late PinTheme focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: Color.fromRGBO(65, 110, 152, 1)),
    borderRadius: BorderRadius.zero,
  );

  late PinTheme submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: Color(0xFF93D2F3),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Pinput(
       length: widget.length,
       controller: widget.tt,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      // validator: (s) {
      //   return s == '2222' ? null : 'Pin is incorrect';
      // },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      smsRetriever: smsRetrieverImpl,
      // onCompleted: (pin) => print(pin),
    );
  }
}
