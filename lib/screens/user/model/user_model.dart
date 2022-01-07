class User {
  User({required this.data});

  Data data;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(data: Data.fromJson(json['data']));
  }
}

class Data {
  int id;
  String email, name;
  Data({required this.id, required this.name, required this.email});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(id: json['id'], name: json['name'], email: json['email']);
  }

  Map<String, dynamic> toJson() => {"id": id, "name": name, "email": email};
}
