import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:sakartone/layout/layout.dart';
import 'package:sakartone/model/employees_model.dart';
import 'package:sakartone/providers/employees_provider.dart';

class EmployeeUpdate extends StatefulWidget {
  static const String routeName = '/employee-update';
  final String someState = "";
  const EmployeeUpdate();

  @override
  State<EmployeeUpdate> createState() => _EmployeeUpdateState();
}

class _EmployeeUpdateState extends State<EmployeeUpdate> {
  DateTime selectedDate = DateTime.now();
  bool Lundi = false;
  bool Mardi = true;
  bool Mercredi = true;
  bool Jeudi = true;
  bool Vendredi = false;
  bool Samedi = false;
  bool Dimanche = true;


  String someState = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  final RegExp regexPhoneNumber = RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
  final RegExp regexNames =
  RegExp(r'([a-z]{2,20}$)'); //todo nombre max de lettre.
  //Le membre sur lequel on a cliqué.
  Employees? employee;
  //On définis l'employé que l'on vas modifier.
  Employees newEmployees = Employees(
    id: "",
    firstname: " ",
    name: " ",
    hiringDate: DateTime.now(),
    salary: 0,
    days: [],
    team: 1,
  );
/*  Employees buildEmployees(Employees current) {
    //todo Vérifier si les champs de currents ne sont pas vide.
    Employees employees = Employees(
      id: current.id,
      firstname: current.firstname,
      name: current.name,
      hiringDate: current.hiringDate,
      salary: current.salary,
      days: current.days,
      team: current.team,
    );
    return employees;
  }*/

  @override
  void initState() {
    super.initState();
    //On récupère l'employé sur lequel on a cliqué.
    // employee =
    //     Provider.of<EmployeesProvider>(context, listen: false).currentEmployees;
    //On construit l'employé que l'on modifie.
    // buildEmployees(employee!);
  }

/*  void setDepartureDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: endDate == null
          ? DateTime.now().add(const Duration(days: 365 * 100))
          : endDate!,
    ).then((pickDate) {
      if (pickDate != null) {
        setState(() {
          departureDate = pickDate;
          newTrip.departureDate =
              DateFormat('dd/MM/yyyy').format(departureDate!);
        });
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body:
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Mettre à jour un employé'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
/*                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child:
                        TextFormField(

                          //TODO put employee data
                          initialValue: "Doe",

                          decoration: const InputDecoration(
                            labelText: 'Nom de famille',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          onSaved: (value) => newEmployees.name = value!,
                          validator: (name) => name != null && name.isEmpty ||
                              name != null && !regexNames.hasMatch(name)
                              ? 'Saisissez un nom valide'
                              : null,
                        )
                    ),*/

                    /*TextFormField(
                      initialValue: MyApp.currentUser!.pseudo,
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(fontFamily: "Mantinia"),
                        fillColor: Colors.white,
                        filled: true,
                        border: UnderlineInputBorder(),
                        labelText: 'Pseudo',
                      ),
                      onSaved: (value) => updateUser.pseudo = value!,
                    ),*/

/*                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child:
                        TextFormField(

                          //TODO put employee data
                          initialValue: "John",

                          decoration: const InputDecoration(
                            labelText: 'Prénom',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          onSaved: (value) => newEmployees.firstname = value!,
                          validator: (name) => name != null && name.isEmpty ||
                              name != null && !regexNames.hasMatch(name)
                              ? 'Saisissez un nom valide'
                              : null,
                        )
                    ),*/
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: TextFormField(

                          //TODO put employee data
                          initialValue: "2",

                          decoration: const InputDecoration(
                            labelText: 'Equipe',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          onSaved: (value) => newEmployees.team = int.parse(value!),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: TextFormField(
                        //TODO Put employee data
                        initialValue: "1024",
                        decoration: const InputDecoration(
                          labelText: 'Salaire journalier',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
    /*                const Text('Départ'),
                    ElevatedButton(
                      onPressed: setDepartureDate,
                      child: Text((departureDate == null)
                          ? "Pick a departure date"
                          : DateFormat('dd/MM/yyyy').format(departureDate!)),
                    ),*/
                  ],
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
                    onPressed: submitUpdateEmployee, child: const Text(
                    "Modifier l'employé",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(190, 129, 57, 1.0)
                    ))),


                /*ElevatedButton(
                  *//*     style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle:
                        const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)
                    ),*//*
                  onPressed: () {
                    // _selectDate(context);
                  },
                  child: const Text("Date d'embauche"),
                ),*/



                // Text(
                //     "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
              ],
            )));
  }
  submitUpdateEmployee() {

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
