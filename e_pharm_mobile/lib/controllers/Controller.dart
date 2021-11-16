abstract class Controller<T> {
  insertAll(List<T>? model);

  insert(T? model);

  Future<List<T>?> select(
      {List<String> fields = const ["*"],
      List<String> whereConditions = const [],
      List<dynamic>? whereArgs});
}
