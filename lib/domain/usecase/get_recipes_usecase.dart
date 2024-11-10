part of 'usecase.dart';

class GetRecipesUsecase implements BaseUseCase<void, List<Recipe>> {
  final Repository _repository;

  GetRecipesUsecase(this._repository);

  @override
  Future<Either<Failure, List<Recipe>>> execute(void input) =>
      _repository.getRecipes();
}
