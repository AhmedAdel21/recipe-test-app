part of 'recipe_details_page_bloc.dart';

sealed class RecipeDetailsPageEvent {
  const RecipeDetailsPageEvent();
}

class RecipeDetailsPageToggleFavoriteState extends RecipeDetailsPageEvent {
  const RecipeDetailsPageToggleFavoriteState();
}
