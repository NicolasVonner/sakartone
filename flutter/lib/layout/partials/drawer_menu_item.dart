
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerMenuItem extends StatelessWidget {
  final String itemTitle;
  final String route;
  final IconData icon;

  const DrawerMenuItem(
      {
        required this.itemTitle,
        required this.route,
        required this.icon,
      }
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      child : Container(
        width: 200,
        padding: EdgeInsets.fromLTRB(50, 10, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              
              child: Text(
                itemTitle,
                textDirection: TextDirection.ltr,
                
                style: GoogleFonts.montserrat(
                  color: Color(0xFF202020),
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.none,
                  fontSize: 18.0,
                ),      
              ),
            ),
          ]
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
    
  }
}


