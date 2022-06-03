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
      body: Center(
        child: Column(
          children: [
            //LOGOTYPE
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text("Liste des employés",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.only(top: 5,bottom: 40),
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Color(0xFFFFD88B)
              ),
            ),
            /*ListView(
              children: [
                EmployeeListItem(),
                EmployeeListItem(),
                EmployeeListItem(),
                EmployeeListItem(),
              ],
            ),*/
            Center (
              child : Column(
                children: [
                  EmployeeListItem(type: "light",name: "Paul Fauconnier",date_hiring: "03/03/2022",),
                  EmployeeListItem(type: "dark",name: "Paul Fauconnier",date_hiring: "03/03/2022",),
                  EmployeeListItem(type: "light",name: "Paul Fauconnier",date_hiring: "03/03/2022",),
                  EmployeeListItem(type: "dark",name: "Paul Fauconnier",date_hiring: "03/03/2022",),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color(0xD0FFD88B)
              ),
              child: TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add,color: Color(0xD0000000),),
                    Text("Ajouter un employé",style: TextStyle(color: Color(0xD0000000)),),
                  ],
                ),
                onPressed: () => {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
