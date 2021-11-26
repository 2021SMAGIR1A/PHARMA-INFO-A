import 'dart:convert';

import 'package:e_pharm_mobile/components/components.dart';
import 'package:e_pharm_mobile/controllers/Controller.dart';
import 'package:e_pharm_mobile/controllers/PharmacieCtl.dart';
import 'package:e_pharm_mobile/models/Database.dart';
import 'package:e_pharm_mobile/models/Ville.dart';
import 'package:http/http.dart' as http;

class VilleCtl extends Controller<Locality> {
  static Future get() async {
    try {
      var response = await http.get(Uri.parse(UrlConst.locality),
          headers: {"content-type": "application/json"});
      List<Locality> villes = [];

      if (response.statusCode == 200) {
        await VilleCtl().deleteAll();

        List data = json.decode(utf8.decode(response.bodyBytes));
        villes = (data).map<Locality>((e) => Locality.fromJson(e)).toList();

        villes.forEach((e) async {
          await VilleCtl().save(e);
        });

        //Sauvegarde des pharmacies
        await PharmacieCtl.get(data: data);
      }
      return villes;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future deleteAll() async {
    try {
      await DBase.deleteAll(entity: Entities.ville);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future insertAll(List<Locality>? villes) async {
    try {
      if (villes != null) {
        villes.forEach((ville) async => await insert(ville));
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future save(Locality? model) async {
    try {
      if (model != null) {
        await DBase.save(entity: Entities.ville, model: model.toMap());
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future insert(Locality? ville) async {
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
  Future<List<Locality>> select(
      {List<String> fields = const ["*"],
      List<String> whereConditions = const [],
      List<dynamic>? whereArgs}) async {
    try {
      return (await DBase.select(
              entity: Entities.ville,
              fields: fields,
              whereConditions: whereConditions,
              whereArgs: whereArgs))
          .map((e) => Locality.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
