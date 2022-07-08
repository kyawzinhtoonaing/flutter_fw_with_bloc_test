class SymbolCreationDto {
  final int id;
  final String name;

  const SymbolCreationDto({
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
  SymbolCreationDto.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"];
}