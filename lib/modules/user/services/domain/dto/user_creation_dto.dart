class UserCreationDto {
  final int id;
  final String name;

  const UserCreationDto({
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
  UserCreationDto.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"];
}