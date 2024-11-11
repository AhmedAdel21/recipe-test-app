part of 'home_bloc.dart';

enum HomeStateStatus {
  idle,
  loadingState,
  success,
  failed,
}

final class HomeState extends Equatable {
  const HomeState({
    this.recipes = const {},
    this.state = HomeStateStatus.idle,
    this.errorMessage = "",
  });
  final HomeStateStatus state;
  final Map<String, Recipe> recipes;
  final String errorMessage;
  HomeState copyWith({
    Map<String, Recipe>? recipes,
    HomeStateStatus? state,
    String? errorMessage,
  }) {
    return HomeState(
      recipes: recipes ?? this.recipes,
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  List<Recipe> get getListOfRecipe => recipes.values.toList();
  @override
  String toString() =>
      "HomeState(state: $state, recipes: $recipes, errorMessage: $errorMessage)";
  @override
  List<Object> get props => [state, recipes, errorMessage];
}
