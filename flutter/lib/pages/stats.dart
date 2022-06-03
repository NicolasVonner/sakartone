import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sakartone/layout/layout.dart';

class Stat extends StatelessWidget {
  static const String routeName = '/stats';
  const Stat();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: DrawerMenu(),
      body: Container(
        child: Column(
          children: [
            Top_Bar(scaffoldKey: _scaffoldKey),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(30),
              child: Text.rich(
                TextSpan(
                    text: 'SAKARTONE ',
                    style: GoogleFonts.montserrat(
                      color: Color(0xFF202020),
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'est une jeune Start Up créée en 2021.\n' +
                            'Nous créons pour vous des cartons et des emballages sur mesure renforcés aux endroits clés, éco-responsables et réutilisables.\n\n' +
                            'Même le scotch chez nous est repositionnable et recyclable \n\n' +
                            'Alors n’hésitez plus !',
                        style: GoogleFonts.montserrat(
                          color: Color(0xFF202020),
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                        ),
                      )
                    ]),
              ),
            ),
            Stat_Row_Text(
              text1: 'Chiffre d’affaire 2021 : ',
              text2: ' 30 892,98 €',
            ),
            Stat_Row_Text(
              text1: 'Chiffre d’affaire 2022: ',
              text2: ' 360 892,98 € ',
            ),
            Stat_Row_Text(
              text1: 'Nombre employés : ',
              text2: ' 193 employés',
            ),
            Container(
              padding: EdgeInsets.only(top: 200),
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  InkWell(
                      onTap: () {},
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("image/instagram.png"),
                          ),
                        ),
                      )),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("image/twitter.png"),
                          ),
                        ),
                      )),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("image/facebook.png"),
                          ),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
