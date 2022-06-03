import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:sakartone/layout/layout.dart';

class EmployeeUpdate extends StatelessWidget {
  static const String routeName = '/employee-update';
  const EmployeeUpdate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Text('employee update'),
    );
  }
}
