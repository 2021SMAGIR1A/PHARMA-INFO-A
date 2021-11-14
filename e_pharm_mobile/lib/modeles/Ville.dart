import 'package:e_pharm_mobile/modeles/Pharmacie.dart';

class Ville {
  String? _libelle;
  List<Pharmacie> pharmacies = [];
  Ville.fromJson(Map<String, dynamic> data) {
    fromJson(data);
  }

  fromJson(Map<String, dynamic> data) {
    libelle = data["title"];
    pharmacies =
        (data["pharm"] as List).map((e) => Pharmacie.fromJson(e)).toList();
  }

  String? get libelle => this._libelle;
  set libelle(String? value) => this._libelle = value;
}
