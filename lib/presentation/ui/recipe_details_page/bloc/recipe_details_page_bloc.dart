import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipetestapp/app/di.dart';
import 'package:recipetestapp/domain/model/models.dart';
import 'package:recipetestapp/domain/usecase/usecase.dart';

part 'recipe_details_page_event.dart';
part 'recipe_details_page_state.dart';

class RecipeCubit extends Cubit<Recipe> {
  RecipeCubit(super.initialState);

  void toggleFavoriteState() async {
    final lastState = state;
    emit(state.copyWith(isFavorite: !(state.isFavorite ?? false)));
    (await DI.getItInstance<SetRecipeStateUseCase>().execute(state)).fold(
        (left) {
      emit(lastState);
    }, (right) {});
  }
}
