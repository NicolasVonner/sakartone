import 'package:flutter/material.dart';
import 'package:sakartone/layout/layout.dart';
import 'package:provider/provider.dart';
import 'package:sakartone/model/employees_model.dart';
import 'package:sakartone/providers/employees_provider.dart';

void main() {
  runApp(const Sakartone());
}

class Sakartone extends StatelessWidget {
  const Sakartone({Key? key}) : super(key: key);

  static List<Employees>? employees;

// List<Employees> =
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<EmployeesProvider>(context, listen: false).fetchData();
    Sakartone.employees =
        Provider.of<EmployeesProvider>(context, listen: false).employees;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EmployeesProvider>(
            create: (context) => EmployeesProvider()),
      ],
      child: MaterialApp(
        title: 'Sakartone',
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              )),
          primarySwatch: Colors.blue,
          tabBarTheme: const TabBarTheme(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              // labelStyle: TextStyle(fontFamily: 'Mantinia'), // color for text
              indicator: UnderlineTabIndicator(
                  // color for indicator (underline)
                  borderSide:
                      BorderSide(color: Color.fromRGBO(160, 141, 106, 1.0)))),
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case Home.routeName:
              {
                return MaterialPageRoute(builder: (context) {
                  return Home();
                });
              }
            case Stat.routeName:
              {
                return MaterialPageRoute(builder: (context) {
                  return Stat();
                });
              }
            case EmployeeList.routeName:
              {
                return MaterialPageRoute(builder: (context) {
                  return EmployeeList();
                });
              }
            case EmployeeDetails.routeName:
              {
                return MaterialPageRoute(builder: (context) {
                  return EmployeeDetails();
                });
              }
            case EmployeeUpdate.routeName:
              {
                return MaterialPageRoute(builder: (context) {
                  return EmployeeUpdate();
                });
              }
            case EmployeeCreate.routeName:
              {
                return MaterialPageRoute(builder: (context) {
                  return EmployeeCreate();
                });
              }
            case TeamList.routeName:
              {
                return MaterialPageRoute(builder: (context) {
                  return TeamList();
                });
              }
            case TeamDetails.routeName:
              {
                return MaterialPageRoute(builder: (context) {
                  return TeamDetails();
                });
              }
            case TeamUpdate.routeName:
              {
                return MaterialPageRoute(builder: (context) {
                  return TeamUpdate();
                });
              }
          }
        },
        initialRoute: Home.routeName,
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) => const NotFound());
        },
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
