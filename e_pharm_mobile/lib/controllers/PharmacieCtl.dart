import 'package:e_pharm_mobile/components/components.dart';
import 'package:e_pharm_mobile/controllers/Controller.dart';
import 'package:e_pharm_mobile/models/Database.dart';
import 'package:e_pharm_mobile/models/Pharmacie.dart';
import 'package:http/http.dart' as http;

class PharmacieCtl extends Controller<Pharmacie> {
  @override
  Future<bool> save(Pharmacie? model) async {
    try {
      if (model != null) {
        var dateEnd = DateTime.parse(model.dateEnd!);
        if (dateEnd.isBefore(DateTime.now())) {
          var pharms = await DBase.select(
              entity: Entities.pharmacie,
              whereConditions: ["id = ?"],
              whereArgs: [model.id]);
          if (pharms.isEmpty) {
            //Ajout
          } else {
            //Modification
          }
          return true;
        }
        return false;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Pharmacie>?> select(
      {List<String> fields = const ["*"],
      List<String> whereConditions = const [],
      List<dynamic>? whereArgs}) async {
    try {
      return (await DBase.select(
              entity: Entities.pharmacie,
              fields: fields,
              whereConditions: whereConditions,
              whereArgs: whereArgs))
          .map((e) => Pharmacie.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
