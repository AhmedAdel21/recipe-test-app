import 'package:recipetestapp/data/data_source/local_data_source/permanent_data_source/hive_database.dart/hive_helper.dart';

import 'permanent_data_source/hive_database.dart/hive_database_manager.dart';

abstract class LocalDataSource {
  Future<void> initLocalDataSource();
}

class LocalDataSourceImpl implements LocalDataSource {
  HiveDataBaseManager? _hiveDataBaseManager;

  @override
  Future<void> initLocalDataSource() async {
    _hiveDataBaseManager = HiveDataBaseManagerImpl();
    await _hiveDataBaseManager?.init();
  }

  LocalDataExceptionsType _hiveDataBaseErrorHandler(HiveDataBaseException e) {
    switch (e.message) {
      case HiveDataBaseExceptionsType.dataBaseNotInt:
        return LocalDataExceptionsType.dataBaseNotInt;
      case HiveDataBaseExceptionsType.none:
        return LocalDataExceptionsType.none;
    }
  }
}

enum LocalDataExceptionsType {
  dataBaseNotInt("Data base not init yet"),
  none("");

  final String message;
  const LocalDataExceptionsType(this.message);
}

class LocalDataException implements Exception {
  final LocalDataExceptionsType message;
  LocalDataException([this.message = LocalDataExceptionsType.none]);

  @override
  String toString() => "LocalDataException: ${message.message}";
}
