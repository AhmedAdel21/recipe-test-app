import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipetestapp/data/data_source/local_data_source/permanent_data_source/hive_database.dart/hive_classes.dart';
import 'package:recipetestapp/data/data_source/local_data_source/permanent_data_source/hive_database.dart/hive_helper.dart';

abstract class HiveDataBaseManager {
  Future<void> init();
  Future<void> saveRecipesToDataBase(RecipeEntitiesContainer recipes);
  Future<RecipeEntitiesContainer> get getRecipeEntitiesContainer;
}

class HiveDataBaseManagerImpl implements HiveDataBaseManager {
  HiveDataBase? _dataBase;
  @override
  Future<void> init() async {
    _dataBase = HiveDataBaseImpl();
    await _dataBase?.initHive();
  }

  void _checkDataBaseInitialization() {
    if (_dataBase == null) {
      throw HiveDataBaseException(
          message: HiveDataBaseExceptionsType.dataBaseNotInt);
    }
  }

  @override
  Future<RecipeEntitiesContainer> get getRecipeEntitiesContainer async {
    _checkDataBaseInitialization();
    return _dataBase!.getRecipeEntitiesContainer();
  }

  @override
  Future<void> saveRecipesToDataBase(RecipeEntitiesContainer recipes) async {
    _checkDataBaseInitialization();
    await _dataBase?.saveRecipesToDataBase(recipes);
  }
}

abstract class HiveDataBase {
  Future<void> initHive();
  Future<void> saveRecipesToDataBase(HiveObject recipes);
  Future<RecipeEntitiesContainer> getRecipeEntitiesContainer();
}

class HiveDataBaseImpl implements HiveDataBase {
  LazyBox? dataBaseBox;
  HiveDataBaseImpl();

  @override
  Future<void> initHive() async {
    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else {
      directory = await getTemporaryDirectory();
    }
    Hive
      ..init(directory?.path)
      ..registerAdapter<RecipeEntity>(RecipeEntityAdapter())
      ..registerAdapter<RecipeEntitiesContainer>(
          RecipeEntitiesContainerAdapter());
    dataBaseBox = await Hive.openLazyBox(HiveBoxes.dataBaseBox);
  }

  void _checkDataBaseInitialization() {
    if (dataBaseBox == null) {
      throw HiveDataBaseException(
          message: HiveDataBaseExceptionsType.dataBaseNotInt);
    }
  }

  @override
  Future<RecipeEntitiesContainer> getRecipeEntitiesContainer() async {
    _checkDataBaseInitialization();
    try {
      RecipeEntitiesContainer? container =
          await dataBaseBox!.get(HiveBoxes.recipes) as RecipeEntitiesContainer?;

      if (container != null) {
        return container;
      }
      final newContainer = RecipeEntitiesContainer();
      saveRecipesToDataBase(newContainer);
      return newContainer;
    } catch (e) {
      throw HiveDataBaseException(exception: e);
    }
  }

  @override
  Future<void> saveRecipesToDataBase(HiveObject recipes) async {
    _checkDataBaseInitialization();
    try {
      await dataBaseBox!.put(HiveBoxes.recipes, recipes);
    } catch (e) {
      throw HiveDataBaseException(exception: e);
    }
  }
}

class HiveBoxes {
  static const dataBaseBox = "dataBaseBox";
  static const recipes = " Recipes";
}
