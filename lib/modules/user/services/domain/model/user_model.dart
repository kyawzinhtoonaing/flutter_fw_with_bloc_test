class UserModel {
  final int id;
  final String name;

  const UserModel({
    required this.id,
    required this.name
  });

  // Convert Class To JSON
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      "id": id,
      "name": name
    };
    return json;
  }

  // Convert JSON To Class
  UserModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"];
}