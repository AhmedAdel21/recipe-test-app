part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

class HomeGetRecipes extends HomeEvent {
  const HomeGetRecipes();
}

class HomeMarkRecipeAsFavorite extends HomeEvent {
  const HomeMarkRecipeAsFavorite();
}
