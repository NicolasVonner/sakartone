import 'package:flutter/material.dart';
import 'package:sakartone/layout/layout.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Stat_Row_Text extends StatelessWidget {
  final String text1;
  final String text2;

  Stat_Row_Text({
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30,20, 30, 20),
      child: Text.rich(
        TextSpan(
            text: text1,
            style: GoogleFonts.montserrat(
              color: Color(0xFF202020),
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w300,
              fontSize: 14.0,
            ),
            children: <InlineSpan>[
              TextSpan(
                text: text2,
                style: GoogleFonts.montserrat(
                  color: Color(0xFF202020),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w800,
                  fontSize: 14.0,
                ),
              )
            ]),
      ),
    );
  }
}
