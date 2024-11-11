import 'package:recipetestapp/data/data_source/local_data_source/permanent_data_source/hive_database.dart/hive_classes.dart';
import 'package:recipetestapp/data/data_source/local_data_source/permanent_data_source/hive_database.dart/hive_helper.dart';
import 'permanent_data_source/hive_database.dart/hive_database_manager.dart';

abstract class LocalDataSource {
  Future<void> initLocalDataSource();
  Future<void> saveRecipeId(String recipeId);
  Future<void> removeRecipeId(String recipeId);
  Future<List<String>> getFavoritesRecipeIds();
}

class LocalDataSourceImpl implements LocalDataSource {
  late HiveDataBaseManager _hiveDataBaseManager;

  @override
  Future<void> initLocalDataSource() async {
    _hiveDataBaseManager = HiveDataBaseManagerImpl();
    await _hiveDataBaseManager.init();
  }

  LocalDataExceptionsType _hiveDataBaseErrorHandler(HiveDataBaseException e) {
    switch (e.message) {
      case HiveDataBaseExceptionsType.dataBaseNotInt:
        return LocalDataExceptionsType.dataBaseNotInt;
      case HiveDataBaseExceptionsType.none:
        return LocalDataExceptionsType.none;
    }
  }

  @override
  Future<void> saveRecipeId(String recipeId) async {
    try {
      RecipeEntitiesContainer recipesContainer =
          await _hiveDataBaseManager.getRecipeEntitiesContainer;

      await recipesContainer.saveRecipeId(recipeId);
    } on HiveDataBaseException catch (e) {
      _hiveDataBaseErrorHandler(e);
    }
  }

  @override
  Future<void> removeRecipeId(String recipeId) async {
    try {
      RecipeEntitiesContainer recipesContainer =
          await _hiveDataBaseManager.getRecipeEntitiesContainer;

      await recipesContainer.removeRecipeId(recipeId);
    } on HiveDataBaseException catch (e) {
      _hiveDataBaseErrorHandler(e);
    }
  }

  @override
  Future<List<String>> getFavoritesRecipeIds() async {
    try {
      RecipeEntitiesContainer recipesContainer =
          await _hiveDataBaseManager.getRecipeEntitiesContainer;

      return recipesContainer.getRecipeIds;
    } on HiveDataBaseException catch (e) {
      _hiveDataBaseErrorHandler(e);
      return [];
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
