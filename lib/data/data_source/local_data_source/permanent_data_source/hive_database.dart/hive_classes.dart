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
  Map<String, RecipeEntity> recipeEntities = {};

  Future<void> addRecipe(RecipeEntity recipe) async {
    recipeEntities[recipe.id] = recipe;
    await save();
  }

  List<String> get getRecipeIds => recipeEntities.keys.toList();
}
