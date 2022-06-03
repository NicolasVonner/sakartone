class Employees {
  String? id;
  String firstname;
  String name;
  DateTime hiringDate;
  int salary;
  List days;
  int team;

  Employees(
      {this.id,
      required this.firstname,
      required this.name,
      required this.hiringDate,
      required this.salary,
      required this.days,
      required this.team});

  Employees.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        firstname = json['firstname'],
        name = json['name'],
        hiringDate = DateTime.parse(json['hiringDate']),
        salary = json['salary'],
        days = json['days'],
        team = json['team'];

  Map<String, dynamic> toJson() {
    return id != null
        ? {
            '_id': id,
            'firstname': firstname,
            'name': name,
            'hiringDate': hiringDate.toString(),
            'salary': salary,
            'days': days,
            'team': team
          }
        : {
            'firstname': firstname,
            'name': name,
            'hiringDate': hiringDate.toString(),
            'salary': salary,
            'days': days,
            'team': team
          };
  }

  String showUser() {
    return id != null
        ? "$id\n$firstname\n$name\n$hiringDate\n$salary\n$days\n$team\n\n"
        : "$firstname\n$name\n$hiringDate\n$salary\n$days\n$team\n\n";
  }

  String getFullName() {
    return this.firstname + " " + this.name.toUpperCase();
  }
}
