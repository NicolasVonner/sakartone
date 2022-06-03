import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakartone/layout/layout.dart';
import 'package:sakartone/layout/partials/top_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        drawer: DrawerMenu(),
        body: Stack(alignment: Alignment.center,
          
          children:<Widget> [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("image/people.jpg"),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              
              decoration: BoxDecoration(
                color : Color(0xFFFFD88B).withOpacity(0.5),
              
              ),
            ),
            Container(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 300,
                        height: 90,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("image/logo.png"),
                          ),
                        ),
                      ),
                      Text(
                        'Vous allez emballer ! ',
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.montserrat(
                          color: Color(0xFF202020),
                          decoration: TextDecoration.none,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: Text(
                    'Lancer l\'application',
                    textDirection: TextDirection.ltr,
                    style: GoogleFonts.montserrat(
                      color: Color(0xFFBE8139),
                      decoration: TextDecoration.none,
                      fontSize: 14.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                      primary: Color(0xFFFFD88B),
                      elevation: 0,
                      shadowColor: Color(0xFFFFFFFF)),
                  onPressed: () {},
                )
              ],
            )),
          ],
        ));
  }
}
