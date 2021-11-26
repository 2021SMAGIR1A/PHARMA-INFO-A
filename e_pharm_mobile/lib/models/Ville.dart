class Locality {
  String commune = "";
  String id = "";

  Locality.fromJson(Map<String, dynamic> data) {
    fromJson(data);
  }

  fromJson(Map<String, dynamic> data) {
    id = data["_id"];
    commune = data["commune"];
  }

  Map<String, dynamic>? toMap() => {"_id": id, "commune": commune};
}
