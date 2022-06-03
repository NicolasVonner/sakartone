import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:sakartone/layout/layout.dart';

class Stat extends StatelessWidget {
  static const String routeName = '/stats';
  const Stat();

  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,

      backgroundColor: Colors.white,
      drawer: DrawerMenu(),
      body: Container(
          child: Column(
            children: [
              Top_Bar(scaffoldKey: _scaffoldKey),

          ],
        ),

      ),
      
    );
  }
}
