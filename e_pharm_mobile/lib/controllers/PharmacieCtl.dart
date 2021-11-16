import 'package:e_pharm_mobile/controllers/Controller.dart';
import 'package:e_pharm_mobile/models/Database.dart';
import 'package:e_pharm_mobile/models/Pharmacie.dart';

class PharmacieCtl extends Controller<Pharmacie> {
  @override
  insertAll(List<Pharmacie>? pharmacies) {
    try {
      if (pharmacies != null) {
        pharmacies.forEach((pharm) async => await insert(pharm));
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  insert(Pharmacie? pharmacie) async {
    try {
      if (pharmacie != null) {
        await DBase.insert(
            entity: Entities.pharmacie, model: pharmacie.toMap());
        return true;
      }
      return false;
    } catch (e) {
      print(e);
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
