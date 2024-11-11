part of 'usecase.dart';

class SetRecipeStateUseCase implements BaseUseCase<Recipe, bool> {
  final Repository _repository;

  SetRecipeStateUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(Recipe input) =>
      _repository.setRecipeState(input);
}
