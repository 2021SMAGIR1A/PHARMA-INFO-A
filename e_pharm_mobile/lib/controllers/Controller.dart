abstract class Controller<T> {
  insertAll(List<T>? model) {
    throw UnimplementedError();
  }

  Future<bool> insert(T? model) {
    throw UnimplementedError();
  }

  Future<bool> save(T? model) {
    throw UnimplementedError();
  }

  Future<List<T>?> select(
      {List<String> fields = const ["*"],
      List<String> whereConditions = const [],
      List<dynamic>? whereArgs}) {
    throw UnimplementedError();
  }
}
