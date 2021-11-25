class Pharmacie {
  String? label;
  String? location;
  String? tel;
  String? director;
  String? dateStart;
  String? dateEnd;
  String? lat;
  String? long;
  int? idLoc;
  int? id;

  Pharmacie.fromJson(Map<String, dynamic> data, {int? idCom}) {
    if (idCom != null) {
      fromJson(data, idLoc: idCom);
    } else {
      fromJson(data);
    }
  }

  fromJson(Map<String, dynamic> data, {int? idLoc}) {
    label = data["label"];
    id = data["_id"];
    this.idLoc = data["idLoc"] ?? idLoc;
    location = data["location"];
    director = data["director"];
    tel = data["tel"];
    dateStart = data["dateStart"];
    dateEnd = data["dateEnd"];
    lat = data["lat"];
    long = data["long"];
  }

  Map<String, dynamic>? toMap() => {
        "label": label,
        "idPharm": id,
        "id": idLoc,
        "location": location,
        "director": director,
        "tel": tel,
        "dateStart": dateStart,
        "dateEnd": dateEnd,
        "lat": lat,
        "long": long,
      };
}
