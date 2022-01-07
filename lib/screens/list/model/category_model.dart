class Category {
  Category({required this.data});

  Data data;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(data: Data.fromJson(json['data']));
  }
}

class Data {
  int id;
  String icon, name, color;
  Data(
      {required this.id,
      required this.name,
      required this.icon,
      required this.color});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        name: json['name'],
        icon: json['icon'],
        color: json['color']);
  }

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "icon": icon, "color": color};
}
