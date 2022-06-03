import 'package:sakartone/layout/layout.dart';
import 'package:sakartone/layout/partials/drawer_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sakartone/pages/home.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: Container(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  width: 120,
                  height: 70,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("image/logo.png"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              DrawerMenuItem(
                  itemTitle: 'Accueil',
                  route: Home.routeName,
                  icon: Icons.home),
              DrawerMenuItem(
                itemTitle: 'Statistiques',
                route: Stat.routeName,
                icon: Icons.trending_up,
              ),
              DrawerMenuItem(
                itemTitle: 'Liste employés',
                route: EmployeeList.routeName,
                icon: Icons.person,
              ),
              DrawerMenuItem(
                itemTitle: 'Liste des équipes',
                route: TeamList.routeName,
                icon: Icons.list,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.all(50),
                child: Container(
                  padding: EdgeInsets.only(top: 200),
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("image/instagram.png"),
                              ),
                            ),
                          )),
                      InkWell(
                          onTap: () {},
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("image/twitter.png"),
                              ),
                            ),
                          )),
                      InkWell(
                          onTap: () {},
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("image/facebook.png"),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
