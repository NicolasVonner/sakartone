class User {
  String? id;
  String name;

  User({
    this.id,
    required this.name,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'];

  Map<String, dynamic> toJson() {
    return id != null
        ? {
            '_id': id,
            'name': name,
          }
        : {
            'name': name,
          };
  }

  String showUser() {
    return id != null ? "$id\n$name\n\n" : "$name\n\n";
  }
}
