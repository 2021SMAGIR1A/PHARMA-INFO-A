class Pharmacie {
  String? label;
  String? location;
  String? tel;
  String? director;
  String? dateStart;
  String? dateEnd;
  String? lat;
  String? long;
  int? idCommune;
  int? idPharm;

  Pharmacie.fromJson(Map<String, dynamic> data, {int? idCom}) {
    if (idCom != null) {
      fromJson(data, idCom: idCom);
    } else {
      fromJson(data);
    }
  }

  fromJson(Map<String, dynamic> data, {int? idCom}) {
    label = data["label"];
    idPharm = data["idPharm"];
    idCommune = data["id"] ?? idCom;
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
        "idPharm": idPharm,
        "id": idCommune,
        "location": location,
        "director": director,
        "tel": tel,
        "dateStart": dateStart,
        "dateEnd": dateEnd,
        "lat": lat,
        "long": long,
      };
}
