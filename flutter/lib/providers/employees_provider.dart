import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection'; // nouveaux type de listes comme UnmodifiableListView
import 'dart:convert'; // pour decoder la réponse http

import 'package:sakartone/providers/settings.dart';

//Models
import 'package:sakartone/model/employees_model.dart';

class EmployeesProvider with ChangeNotifier {
  final String _host = Settings.host;
  List<Employees> _employees = [];
  // Getter pour l'accès en lecture de l'ensemble des profiles
  // Pas de modificiation possible grâce au type UnmodifiableListView
  UnmodifiableListView<Employees> get employees =>
      UnmodifiableListView(_employees);

  // Récupérer les données dans la base de données
  Future<void> fetchData() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$_host/api/employees/'),
        headers: {
          'Content-type': 'application/json',
          "Access-Control-Allow-Origin":
              "*", // Required for CORS support to work
          "Access-Control-Allow-Credentials":
              'true', // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        },
      );
      if (response.statusCode == 200) {
        print("req");
        print(json.decode(response.body));
        _employees = (json.decode(response.body) as List)
            .map((userJson) => Employees.fromJson(userJson))
            .toList();

        //notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  // Ajouter un profile dans la base de données
  Future<void> addUser(Employees newUser) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$_host/api/users'),
        body: json.encode(newUser.toJson()), //todo enlever le toJson?
        headers: {
          'Content-type': 'application/json',
          "Access-Control-Allow-Origin":
              "*", // Required for CORS support to work
          "Access-Control-Allow-Credentials":
              'true', // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        },
      );
      if (response.statusCode == 200) {
        print("On a ajoute un user ${response.body}");
        _employees.add(
          Employees.fromJson(
            json.decode(response.body),
          ),
        );
        //notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  // Future<String> logUser(Employees user) async {
  //   try {
  //     http.Response response = await http.post(
  //       Uri.parse('$_host/api/users/login'),
  //       body: json.encode(user.toJson()),
  //       headers: {'Content-type': 'application/json'},
  //     );
  //     Map<String, dynamic> temp = json.decode(response.body);

  //     if (response.statusCode == 200) {
  //       print("ON RECUPERE LE USER");
  //       //On récupère le user.
  //       List<User>? result = await getUsers(user);
  //       session = result?[0];
  //       notifyListeners();
  //       return ("200");
  //     } else {
  //       session = null;
  //       return (temp['error']);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

// Récupère le ou les users qui correspondent aux paramètres fournis.
  Future<List<Employees>?> getUsers(Employees req) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$_host/api/users/by'),
        body: json.encode(req.toJson()),
        headers: {
          'Content-type': 'application/json',
          "Access-Control-Allow-Origin":
              "*", // Required for CORS support to work
          "Access-Control-Allow-Credentials":
              'true', // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        },
      );
      List<dynamic> temp = json.decode(response.body);
      // debugPrint("La reponse est ==>${temp[0]}");

      if (response.statusCode == 200) {
        return (json.decode(response.body) as List)
            .map((userJson) => Employees.fromJson(userJson))
            .toList();
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
