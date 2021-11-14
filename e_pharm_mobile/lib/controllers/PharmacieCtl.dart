import 'dart:convert';

import 'package:e_pharm_mobile/modeles/Ville.dart';
import 'package:http/http.dart' as http;

class PharmacieCtl {
  static String _url = "http://192.168.0.27/garde_pham.json";

  static Future<List<Ville>> get() async {
    // try {
    var response = await http
        .get(Uri.parse(_url), headers: {"content-type": "application/json"});
    List<Ville> villes = [];

    if (response.statusCode == 200)
      villes = (json.decode(utf8.decode(response.bodyBytes)) as List)
          .map<Ville>((e) => Ville.fromJson(e))
          .toList();
    return villes;
    // } catch (e) {
    //   print(e);
    //   return [];
    // }
  }
}
