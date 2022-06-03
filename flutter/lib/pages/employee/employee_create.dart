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

    DateTime selectedDate = DateTime.now();
    bool Lundi = false;
    bool Mardi = false;
    bool Mercredi = false;
    bool Jeudi = false;
    bool Vendredi = false;
    bool Samedi = false;
    bool Dimanche = false;
    String firstName = "";
    String lastName = "";
    int team = 0;
    int salary = 0;
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
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child:
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Nom de famille',
                              fillColor: Colors.white,
                              filled: true,
                          ),
                          onSaved: (value) => lastName = value!,
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child:
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Prénom',
                              fillColor: Colors.white,
                              filled: true,
                          ),
                          onSaved: (value) => firstName = value!,
                        )
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
                          onSaved: (value) => team = int.parse(value!),

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
                          onSaved: (value) => salary = int.parse(value!),
                        ),
                      )

                    ],
                  ),
                  Column(
                    children : [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            textStyle:
                            const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)
                        ),
                        onPressed: () {
                          _selectDate(context);
                        },
                        child: const Text("Date d'embauche"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child:
                        Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                      )
                    ]
                  ),

                  Text("Jours travaillés : ", style: TextStyle(fontSize: 14), textAlign: TextAlign.left,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          side: BorderSide(
                              width: 2,
                              color: _isDayChecked(Lundi),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Lundi= !Lundi;
                          });
                        },
                        child: Text("Lundi",
                            style: TextStyle(color: _isDayChecked(Lundi))),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          side:  BorderSide(
                              width: 2,
                              color: _isDayChecked(Mardi)
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Mardi= !Mardi;
                          });
                        },
                        child: Text("Mardi",
                            style:TextStyle(color: _isDayChecked(Mardi))),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          side: BorderSide(
                              width: 2,
                              color: _isDayChecked(Mercredi)
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Mercredi= !Mercredi;
                          });
                        },
                        child: Text("Mercredi",
                            style: TextStyle(color: _isDayChecked(Mercredi))),
                      ),
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          side: BorderSide(
                              width: 2,
                              color: _isDayChecked(Jeudi)
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Jeudi= !Jeudi;
                          });
                        },
                        child: Text("Jeudi",
                            style: TextStyle(color: _isDayChecked(Jeudi))),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          side:BorderSide(
                              width: 2,
                              color: _isDayChecked(Vendredi)
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Vendredi= !Vendredi;
                          });
                        },
                        child: Text("Vendredi",
                            style: TextStyle(color: _isDayChecked(Vendredi))),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          side: BorderSide(
                              width: 2,
                              color: _isDayChecked(Samedi)
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Samedi= !Samedi;
                          });
                        },
                        child: Text("Samedi",
                            style: TextStyle(color: _isDayChecked(Samedi))),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          side: BorderSide(
                              width: 2,
                              color: _isDayChecked(Dimanche)
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Dimanche= !Dimanche;
                          });
                        },
                        child: Text("Dimanche",
                            style: TextStyle(color: _isDayChecked(Dimanche))),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(255, 216, 139, 1),
                          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                      ),
                      onPressed: submitCreateUser, child: const Text(
                      "Créer l'employé",
                      style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(190, 129, 57, 1.0)
                  ))),
                ],
              )
          )
      );
    }

    submitCreateUser()
    {

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
    _isDayChecked(bool dayState) {
      if (dayState) {
        return Colors.black;
      } else {
        return Colors.grey;
      }
    }
  }

