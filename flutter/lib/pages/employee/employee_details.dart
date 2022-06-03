import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sakartone/layout/layout.dart';

class EmployeeDetails extends StatefulWidget {
  static const String routeName = '/employee-details';

  const EmployeeDetails();

  @override
  _EmployeeDetailsState createState() {
    return _EmployeeDetailsState();
  }
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool Lundi = false;
  bool Mardi = false;
  bool Mercredi = true;
  bool Jeudi = false;
  bool Vendredi = true;
  bool Samedi = true;
  bool Dimanche = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Top_Bar(scaffoldKey: _scaffoldKey),
        Container(
          padding: EdgeInsets.all(30),
          child: Column(children: [
            Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFE9E8E8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                      ),
                      onPressed: () => {},
                    ),
                    Text(
                      'Paul Fauconnier',
                      textDirection: TextDirection.ltr,
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF202020),
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ))
          ]),
        ),
        Stat_Row_Text(text1: 'Nom de famille : ', text2: ' FAUCONNIER'),
        Stat_Row_Text(text1: 'Prénom : ', text2: ' Paul'),
        Stat_Row_Text(text1: 'Équipe : ', text2: ' Client'),
        Stat_Row_Text(text1: 'Salaire journalier : ', text2: ' Client'),
        Stat_Row_Text(text1: 'Date d’embauche : ', text2: ' 20/03/2022'),
        Stat_Row_Text(text1: 'Cout à l’année : ', text2: ' 30 892,98 €'),
        Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Jours travaillés : ",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  side: BorderSide(
                    width: 2,
                    color: _isDayChecked(Lundi),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    Lundi = !Lundi;
                  });
                },
                child: Text("Lundi",
                    style: TextStyle(color: _isDayChecked(Lundi))),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  side: BorderSide(width: 2, color: _isDayChecked(Mardi)),
                ),
                onPressed: () {
                  setState(() {
                    Mardi = !Mardi;
                  });
                },
                child: Text("Mardi",
                    style: TextStyle(color: _isDayChecked(Mardi))),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  side: BorderSide(width: 2, color: _isDayChecked(Mercredi)),
                ),
                onPressed: () {
                  setState(() {
                    Mercredi = !Mercredi;
                  });
                },
                child: Text("Mercredi",
                    style: TextStyle(color: _isDayChecked(Mercredi))),
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    side: BorderSide(width: 2, color: _isDayChecked(Jeudi)),
                  ),
                  onPressed: () {
                    setState(() {
                      Jeudi = !Jeudi;
                    });
                  },
                  child: Text("Jeudi",
                      style: TextStyle(color: _isDayChecked(Jeudi))),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    side: BorderSide(width: 2, color: _isDayChecked(Vendredi)),
                  ),
                  onPressed: () {
                    setState(() {
                      Vendredi = !Vendredi;
                    });
                  },
                  child: Text("Vendredi",
                      style: TextStyle(color: _isDayChecked(Vendredi))),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    side: BorderSide(width: 2, color: _isDayChecked(Samedi)),
                  ),
                  onPressed: () {
                    setState(() {
                      Samedi = !Samedi;
                    });
                  },
                  child: Text("Samedi",
                      style: TextStyle(color: _isDayChecked(Samedi))),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    side: BorderSide(width: 2, color: _isDayChecked(Dimanche)),
                  ),
                  onPressed: () {
                    setState(() {
                      Dimanche = !Dimanche;
                    });
                  },
                  child: Text("Dimanche",
                      style: TextStyle(color: _isDayChecked(Dimanche))),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(30),
          width: 300,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(255, 216, 139, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              ),
              onPressed: () => {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: const [
                  Icon(Icons.edit, color: Color.fromRGBO(190, 129, 57, 1.0)),
                  Text(
                    "Modifier l'employé",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(190, 129, 57, 1.0)
                        )
                  )
                ],
              )),
        ),
        Container(
          padding: EdgeInsets.all(30),
          width: 300,
          child: TextButton(
              
              onPressed: () => {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.delete, color: Color.fromRGBO(190, 129, 57, 1.0)),
                  Text(
                    "Supprimer l'employé",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(190, 129, 57, 1.0)
                        )
                  )
                ],
              )),
        ),
      ]),
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
