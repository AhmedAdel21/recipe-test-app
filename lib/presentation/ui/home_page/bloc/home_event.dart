part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

class HomeGetRecipes extends HomeEvent {
  const HomeGetRecipes();
}

class HomeRecipeStatChanged extends HomeEvent {
  final Recipe recipe;
  const HomeRecipeStatChanged(this.recipe);
}
