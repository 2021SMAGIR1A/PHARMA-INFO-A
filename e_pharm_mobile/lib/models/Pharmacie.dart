import 'package:geolocator/geolocator.dart';

class Pharmacie {
  String? label;
  String? location;
  String? tel;
  String? director;
  String? dateStart;
  String? dateEnd;
  String? lat = "0";
  String? long = "0";
  String? idLoc;
  String? id;
  int _distance = 0;

  Pharmacie.fromJson(Map<String, dynamic> data, {String? idCom}) {
    if (idCom != null) {
      fromJson(data, idLoc: idCom);
    } else {
      fromJson(data);
    }
  }

  fromJson(Map<String, dynamic> data, {String? idLoc}) {
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
        "_id": id,
        "idLoc": idLoc,
        "location": location,
        "director": director,
        "tel": tel,
        "dateStart": dateStart,
        "dateEnd": dateEnd,
        "lat": lat,
        "long": long,
      };

  int get distance => _distance;
  set distance(int distance) => _distance = distance;
}
