import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UseProfile extends StatelessWidget {
  const UseProfile({
    super.key,
    required this.descrip,
    required this.title,
    required this.image,
    required this.ontap,
    required this.check,
  });
  final String title, descrip, image;
  final void Function() ontap;
  final bool check;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 89,
        width: 328,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.zero),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.circle_outlined,
                    size: 24,
                  ),
                  check ? const Icon(
                    Icons.brightness_1,
                    size: 16,
                    color: Color(0xFF2E3B62),
                  ):const SizedBox(),
                ],
              ),
            ),
            Image.asset(image),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  descrip,
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6A6C7B),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
