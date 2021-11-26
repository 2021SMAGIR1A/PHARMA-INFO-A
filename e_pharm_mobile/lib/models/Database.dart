import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

enum Entities { ville, pharmacie }

class GetName {
  static String getEntityName(Entities entity) {
    return entity.toString().substring(
        entity.toString().indexOf(".") + 1, entity.toString().length);
  }
}

class DBase {
  static Database? _database;
  static Future<Database> get database async {
    return _database ?? await create();
  }

  static Future<Database> create() async {
    Directory repertoire = await getApplicationDocumentsDirectory();
    String dbPath = join(repertoire.path + "e_pharm.db");
    var dataBase = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return dataBase;
  }

  static Future _onCreate(Database db, int version) async {
    await db.execute("""
        CREATE TABLE ville(
          _id VARCHAR PRIMARY KEY,
          commune VARCHAR
        )""");
    await db.execute("""
        CREATE TABLE pharmacie(
          _id VARCHAR PRIMARY KEY,
          label VARCHAR,
          location VARCHAR,
          tel VARCHAR,
          director VARCHAR,
          dateStart VARCHAR,
          dateEnd VARCHAR,
          lat VARCHAR,
          long VARCHAR,
          idLoc VARCHAR
        )""");
  }

  static Future insert(
      {@required Entities? entity,
      @required Map<String, dynamic>? model}) async {
    Database db = await database;
    Batch batch = db.batch();
    batch.insert(GetName.getEntityName(entity!), model!);
    await batch.commit(noResult: true);
  }

  static Future update(
      {@required Entities? entity,
      @required Map<String, dynamic>? model,
      String? whereCondition,
      List<dynamic>? whereArgs}) async {
    Database? db = await database;
    Batch batch = db.batch();
    batch.update(GetName.getEntityName(entity!), model!,
        where: whereCondition, whereArgs: whereArgs);
    await batch.commit(noResult: true);
  }

  static Future<List<Map<String, dynamic>>> select(
      {Entities? entity,
      List<String> fields = const ["*"],
      List<String> whereConditions = const [],
      List? whereArgs,
      String query = ""}) async {
    List<Map<String, dynamic>> data = [];
    Database? db = await database;
    String queryLog = "";
    if (queryLog == "") {
      if (whereConditions.isNotEmpty) {
        queryLog = "SELECT " +
            fields.join(", ") +
            " FROM ${GetName.getEntityName(entity!)} WHERE " +
            whereConditions.join(" AND ");
        print(queryLog);
        data = await db.rawQuery(queryLog, whereArgs);
      } else {
        queryLog = "SELECT " +
            fields.join(", ") +
            " FROM ${GetName.getEntityName(entity!)}";
        data = await db.rawQuery(queryLog);
      }
    } else {
      data = await db.rawQuery(query);
    }
    return data;
  }

  static Future deleteWhere(
      {@required Entities? entity, @required int? id}) async {
    Database? db = await database;
    await db.delete(GetName.getEntityName(entity!),
        where: "_id = ?", whereArgs: [id]);
  }

  static Future deleteAll({@required Entities? entity}) async {
    Database? db = await database;
    await db.delete(GetName.getEntityName(entity!));
  }

  static Future save(
      {@required Entities? entity,
      @required Map<String, dynamic>? model}) async {
    try {
      List<Map<String, dynamic>> data = await select(
          entity: entity,
          whereConditions: ["_id = ?"],
          whereArgs: [model!["_id"]]);
      if (data.isEmpty) {
        await insert(entity: entity, model: model);
      } else {
        await update(
            entity: entity,
            model: model,
            whereCondition: "_id = ?",
            whereArgs: [model["_id"]]);
      }
    } catch (e) {
      print(e);
    }
  }
}
