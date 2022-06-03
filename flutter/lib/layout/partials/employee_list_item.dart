import 'package:flutter/material.dart';

class EmployeeListItem extends StatelessWidget {

  String type;//light or dark
  String name;
  String date_hiring;

  EmployeeListItem({
    this.type = "light",
    required this.name,
    required this.date_hiring,
});

  @override
  Widget build(BuildContext context) {

    Color eye_color = Color(0xFF777777);
    Color bg_color = Color(0xFFE9E8E8);
    if (this.type == "light") {
      eye_color = Color(0xFF777777);
      bg_color = Color(0xFFE9E8E8);
    }
    if (this.type == "dark") {
      eye_color = Color(0xFFFFD88B);
      bg_color = Color(0xFFBFBABA);
    }


    return Container(
      width: 350,
      height: 40,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: bg_color,
      ),
      child : Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(this.name,style: TextStyle(fontWeight: FontWeight.bold),),
            width: 180,
          ),
          Container(
            width: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Embauché le :"),
                Text(this.date_hiring,style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          Container(
            width: 60,
            child: Icon(Icons.remove_red_eye_outlined,color: eye_color,),
          )
        ]
      )
    );
  }
}