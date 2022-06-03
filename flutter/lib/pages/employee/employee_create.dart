import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:sakartone/layout/layout.dart';

class EmployeeCreate extends StatefulWidget {
  static const String routeName = '/employee-create';

  const EmployeeCreate();

  @override
  _EmployeeCreateState createState() {
    return _EmployeeCreateState();
  }
}
  class _EmployeeCreateState extends State<EmployeeCreate> {
    String date = "";
    DateTime selectedDate = DateTime.now();


@override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: const CustomAppBar(),
          body:
          Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 75, vertical: 8),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Créer un nouvel employé'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Nom de famille',
                            fillColor: Colors.white,
                            filled: true,
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Prénom',
                            fillColor: Colors.white,
                            filled: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child:
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Equipe',
                              fillColor: Colors.white,
                              filled: true,
                          ),
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child:TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Salaire journalier',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      )

                    ],
                  ),
                  ElevatedButton(
               /*     style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle:
                        const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)
                    ),*/
                    onPressed: () {
                      _selectDate(context);
                    },
                    child: const Text("Date d'embauche"),
                  ),
                  Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                ],

              )
          )
      );
    }

    _selectDate(BuildContext context) async {
      final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2023),
      );
      if (selected != null && selected != selectedDate) {
        setState(() {
          selectedDate = selected;
        }
        );
      }
    }
  }



