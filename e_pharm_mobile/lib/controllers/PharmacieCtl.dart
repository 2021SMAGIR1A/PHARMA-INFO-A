import 'package:e_pharm_mobile/controllers/Controller.dart';
import 'package:e_pharm_mobile/models/Database.dart';
import 'package:e_pharm_mobile/models/Pharmacie.dart';
import 'package:intl/intl.dart';

class PharmacieCtl extends Controller<Pharmacie> {
  static get({required List data}) async {
    try {
      //Sauvegarde des pharmacies
      await DBase.deleteAll(entity: Entities.pharmacie);
      for (var ville in data) {
        for (var pharm in ville["pharmacies"]) {
          PharmacieCtl().save(Pharmacie.fromJson(pharm, idCom: ville["_id"]));
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future save(Pharmacie? model) async {
    try {
      if (model != null) {
        var dateEnd = DateFormat.yMd("en_US").parse(model.dateEnd!);

        if (dateEnd.isAfter(DateTime.now())) {
          var pharms = await DBase.select(
              entity: Entities.pharmacie,
              whereConditions: ["_id = ?"],
              whereArgs: [model.id]);
          print(pharms);
          if (pharms.isEmpty) {
            //Insertion
            await DBase.insert(
                entity: Entities.pharmacie, model: model.toMap());
          } else {
            //Modification
            await DBase.update(
                entity: Entities.pharmacie,
                model: model.toMap(),
                whereCondition: "_id = ?",
                whereArgs: [model.id]);
            // await DBase.save(entity: Entities.pharmacie, model: model.toMap());
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<Pharmacie>> select(
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
