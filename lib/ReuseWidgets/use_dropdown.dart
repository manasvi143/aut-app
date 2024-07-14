import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UseDropDown extends StatelessWidget {
  const UseDropDown({super.key , required this.list , required this.hinttext});

  final String hinttext;
  final List<DropdownMenuEntry> list;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
              width: 216,
              dropdownMenuEntries: list,
              hintText: hinttext,
              textStyle: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              inputDecorationTheme: const InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            );
  }
}