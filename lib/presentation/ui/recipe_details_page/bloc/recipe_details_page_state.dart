part of 'recipe_details_page_bloc.dart';

enum RecipeDetailsPageStateStatus {
  idle,
}

final class RecipeDetailsPageState extends Equatable {
  const RecipeDetailsPageState({
    required this.recipe,
    this.state = RecipeDetailsPageStateStatus.idle,
  });

  final RecipeDetailsPageStateStatus state;
  final Recipe recipe;

  RecipeDetailsPageState copyWith({
    Recipe? recipe,
    RecipeDetailsPageStateStatus? state,
  }) =>
      RecipeDetailsPageState(
        state: state ?? this.state,
        recipe: recipe ?? this.recipe,
      );

  @override
  List<Object?> get props => [state, recipe];
}
