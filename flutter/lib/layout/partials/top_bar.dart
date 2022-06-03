import 'package:flutter/material.dart';
import 'package:sakartone/layout/layout.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

class Top_Bar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  Top_Bar({
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.ltr,
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => scaffoldKey.currentState!.openDrawer()),
            ),
          ],
        ),
        Container(
            height: 90,
            width: 300,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              image: DecorationImage(
                image: AssetImage('image/logo.png'),
                fit: BoxFit.contain,
              ),
            )),
      ]),
    );
  }
}
