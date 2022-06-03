import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:sakartone/layout/layout.dart';
import 'package:provider/provider.dart';

class EmployeeList extends StatefulWidget {
  static const String routeName = '/employee-list';

  @override
  EmployeeListState createState() => new EmployeeListState();
}

class EmployeeListState extends State<EmployeeList> {

  List<Employees>? emps;

  @override
  Widget build(BuildContext context){

    DateTime d = DateTime.parse("2014-03-01T08:00:00.000Z");

  print(emps?.length);

    double containerh = (emps?.length ?? 0.0) * 50;
    if (containerh > 480) {
      containerh = 480;
    }

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
            Container (
              width: 360,
              height: containerh,
              child : /*Column(
                children: [
                  EmployeeListItem(type: "light",name: "Paul Fauconnier",date_hiring: "03/03/2022",),
                  EmployeeListItem(type: "dark",name: "Paul Fauconnier",date_hiring: "03/03/2022",),
                  EmployeeListItem(type: "light",name: "Paul Fauconnier",date_hiring: "03/03/2022",),
                  EmployeeListItem(type: "dark",name: "Paul Fauconnier",date_hiring: "03/03/2022",),
                ],
              ),*/
              ListView.builder(itemBuilder: (context,i) {
                Employees e = emps![i];
                String t = "light";
                if (i%2 != 0) {
                  t = "dark";
                }
                print(e.getFullName());
                String date = e.hiringDate.day.toString() + "/" + e.hiringDate.month.toString() + "/" + e.hiringDate.year.toString();
                return EmployeeListItem(type: t,name: e.getFullName(),date_hiring: date,);
              },
              itemCount: emps?.length,)
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

  @override
  void initState() {
    super.initState();
    /*Provider.of<EmployeesProvider>(context, listen: false).fetchData();
    emps = Provider.of<EmployeesProvider>(context, listen: false).employees;*/
    _getEmployees();
  }

  void _getEmployees() {
    Provider.of<EmployeesProvider>(context, listen: false).fetchData().then(
          (value) {
            print("");
        setState(() {
          emps = Provider.of<EmployeesProvider>(context, listen: false).employees;
          print("test");
        });
      },
    );
  }
}
