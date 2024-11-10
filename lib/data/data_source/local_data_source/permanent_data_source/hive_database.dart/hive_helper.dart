import 'package:recipetestapp/data/data_source/local_data_source/permanent_data_source/hive_database.dart/hive_classes.dart';
import 'package:recipetestapp/domain/model/models.dart';

enum HiveDataBaseExceptionsType {
  dataBaseNotInt(5000),
  none(-5000);

  final int message;
  const HiveDataBaseExceptionsType(this.message);
}

class HiveDataBaseException implements Exception {
  final HiveDataBaseExceptionsType message;
  final Object? exception;
  HiveDataBaseException(
      {this.exception, this.message = HiveDataBaseExceptionsType.none});

  @override
  String toString() => "HiveDataBaseException: ${message.message}";
}

extension RecipeEntityMapper on Recipe {
  RecipeEntity get toDataBaseEntity => RecipeEntity(id: id);
}
