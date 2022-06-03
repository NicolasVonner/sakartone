import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:sakartone/layout/layout.dart';

class EmployeeList extends StatelessWidget {
  static const String routeName = '/employee-list';
  const EmployeeList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Text('employee list'),
    );
  }
}
