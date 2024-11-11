import 'package:hive/hive.dart';
part 'hive_classes.g.dart';

@HiveType(typeId: 0)
class RecipeEntity extends HiveObject {
  @HiveField(0)
  final String id;

  RecipeEntity({required this.id});
}

@HiveType(typeId: 1)
class RecipeEntitiesContainer extends HiveObject {
  RecipeEntitiesContainer();
  @HiveField(0)
  Map<String, String> recipeEntities = {};

  Future<void> saveRecipeId(String recipeId) async {
    recipeEntities[recipeId] = recipeId;
    await save();
  }

  Future<void> removeRecipeId(String recipeId) async {
    recipeEntities.remove(recipeId);
    await save();
  }

  List<String> get getRecipeIds => recipeEntities.keys.toList();
}
