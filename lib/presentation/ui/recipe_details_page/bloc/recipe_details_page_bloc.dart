import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipetestapp/domain/model/models.dart';

part 'recipe_details_page_event.dart';
part 'recipe_details_page_state.dart';

class RecipeDetailsPageBloc
    extends Bloc<RecipeDetailsPageEvent, RecipeDetailsPageState> {
  Recipe recipe;
  RecipeDetailsPageBloc(this.recipe)
      : super(RecipeDetailsPageState(recipe: recipe)) {
    on<RecipeDetailsPageToggleFavoriteState>((event, emit) {});
  }

  void _onRecipeDetailsPageToggleFavoriteState(
      RecipeDetailsPageToggleFavoriteState event,
      Emitter<RecipeDetailsPageState> emit) {
        
      }
}
