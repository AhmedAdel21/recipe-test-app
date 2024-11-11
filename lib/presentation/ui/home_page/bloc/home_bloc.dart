import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipetestapp/app/di.dart';
import 'package:recipetestapp/domain/model/models.dart';
import 'package:recipetestapp/domain/usecase/usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeGetRecipes>(_onHomeGetRecipes);
    on<HomeRecipeStatChanged>(_onHomeRecipeStatChanged);
  }

  void _onHomeRecipeStatChanged(
      HomeRecipeStatChanged event, Emitter<HomeState> emit) async {
    state.recipes[event.recipe.id] = event.recipe;
    state.copyWith(recipes: state.recipes);
  }

  void _onHomeGetRecipes(HomeGetRecipes event, Emitter<HomeState> emit) async {
    if (state.state != HomeStateStatus.loadingState) {
      emit(
        state.copyWith(state: HomeStateStatus.loadingState),
      );

      (await DI.getItInstance<GetRecipesUsecase>().execute(null)).fold((left) {
        emit(
          state.copyWith(
            state: HomeStateStatus.failed,
            errorMessage: left.message,
          ),
        );
      }, (right) {
        emit(
          state.copyWith(
            state: HomeStateStatus.success,
            recipes: right,
          ),
        );
      });
    }
    await emit.forEach(
      DI.getItInstance<GetRecipesUsecase>().onNewRecipe,
      onData: (Recipe recipe) {
        state.recipes[recipe.id] = recipe;
        return state.copyWith(recipes: state.recipes);
      },
    );
  }
}
