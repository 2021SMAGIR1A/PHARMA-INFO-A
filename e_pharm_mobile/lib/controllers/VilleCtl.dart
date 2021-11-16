import 'dart:convert';

import 'package:e_pharm_mobile/controllers/Controller.dart';
import 'package:e_pharm_mobile/models/Database.dart';
import 'package:e_pharm_mobile/models/Ville.dart';
import 'package:http/http.dart' as http;

class VilleCtl extends Controller<Ville> {
  // static String _url = "http://192.168.0.27/garde_pham.json";
  static String _url = "https://duty-pharmacy.herokuapp.com";

  static Future<List<Ville>> get() async {
    try {
      var response = await http
          .get(Uri.parse(_url), headers: {"content-type": "application/json"});
      List<Ville> villes = [];

      if (response.statusCode == 200)
        villes = (json.decode(utf8.decode(response.bodyBytes)) as List)
            .map<Ville>((e) => Ville.fromJson(e))
            .toList();
      return villes;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  insertAll(List<Ville>? villes) {
    try {
      if (villes != null) {
        villes.forEach((ville) async => await insert(ville));
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  insert(Ville? ville) async {
    try {
      if (ville != null) {
        await DBase.insert(entity: Entities.ville, model: ville.toMap());
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<List<Ville>?> select(
      {List<String> fields = const ["*"],
      List<String> whereConditions = const [],
      List<dynamic>? whereArgs}) async {
    try {
      return (await DBase.select(
              entity: Entities.ville,
              fields: fields,
              whereConditions: whereConditions,
              whereArgs: whereArgs))
          .map((e) => Ville.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
