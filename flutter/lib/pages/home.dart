
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:sakartone/layout/layout.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      drawer: DrawerMenu(),
      body:
        Text("Home"),
    );
  }
}
