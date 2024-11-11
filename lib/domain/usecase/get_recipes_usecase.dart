part of 'usecase.dart';

class GetRecipesUsecase implements BaseUseCase<void, Map<String, Recipe>> {
  final Repository _repository;

  GetRecipesUsecase(this._repository);

  @override
  Future<Either<Failure, Map<String, Recipe>>> execute(void input) =>
      _repository.getRecipes();

  Stream<Recipe> get onNewRecipe => _repository.onNewRecipe;
}
