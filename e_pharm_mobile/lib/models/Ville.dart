import 'package:e_pharm_mobile/models/Pharmacie.dart';

class Ville {
  String? commune;
  int? id;

  List<Pharmacie> pharmacies = [];
  Ville.fromJson(Map<String, dynamic> data) {
    fromJson(data);
  }

  fromJson(Map<String, dynamic> data) {
    commune = data["commune"];
    id = data["id"];
    pharmacies = (data["pharmacies"] as List)
        .map((e) => Pharmacie.fromJson(e, idCom: data["id"]))
        .toList();
  }

  Map<String, dynamic>? toMap() => {"id": id, "commune": commune};
}
