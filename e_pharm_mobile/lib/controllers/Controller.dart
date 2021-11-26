abstract class Controller<T> {
  Future insertAll(List<T>? model) async {
    throw UnimplementedError();
  }

  Future insert(T? model) async {
    throw UnimplementedError();
  }

  Future save(T? model) async {
    throw UnimplementedError();
  }

  Future deleteAll() {
    throw UnimplementedError();
  }

  Future<List<T>?> select(
      {List<String> fields = const ["*"],
      List<String> whereConditions = const [],
      List<dynamic>? whereArgs}) async {
    throw UnimplementedError();
  }
}
