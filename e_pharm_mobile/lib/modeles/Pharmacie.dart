class Pharmacie {
  String? name;
  String? site;
  String? dateDebut;
  String? dateFin;
  double? _lat;
  double? _long;

  Pharmacie.fromJson(Map<String, dynamic> data) {
    fromJson(data);
  }

  fromJson(Map<String, dynamic> data) {
    print(data["pos"] is List);
    name = data["name"];
    site = data["sit"];
    dateDebut = data["datD"];
    dateFin = data["datF"];
    // lat = data["pos"][0];
    // long = data["pos"][1];
  }

  double? get lat => this._lat;
  set lat(value) => this._lat = double.parse(value.toString());
  double? get long => this._long;
  set long(value) => this._long = double.parse(value.toString());
}
