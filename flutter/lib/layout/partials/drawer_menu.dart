import 'package:sakartone/layout/layout.dart';
import 'package:sakartone/layout/partials/drawer_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:sakartone/pages/home.dart';

class DrawerMenu extends StatelessWidget {

  const DrawerMenu();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color.fromRGBO(255, 216, 139, 1.0),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: const [
              DrawerMenuItem(itemTitle: 'Accueil', route: Home.routeName),
              DrawerMenuItem(itemTitle: 'Statistiques', route: Stat.routeName),
              DrawerMenuItem(itemTitle: 'Liste employés', route: EmployeeList.routeName),
            ],
          ),
        )
    );
  }
}