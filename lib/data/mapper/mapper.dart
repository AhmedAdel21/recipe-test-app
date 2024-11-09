import 'package:recipetestapp/app/constants/global_constants.dart';
import 'package:recipetestapp/data/response/responses.dart';
import 'package:recipetestapp/domain/model/models.dart';
import "package:recipetestapp/app/extensions.dart";

extension AuthenticationMapper on AuthenticationResponse? {
  Authentication get toDomain => Authentication(
        this?.userId.orMinusOne ?? Constants.minusOne,
        this?.email.orEmpty ?? Constants.empty,
        this?.password.orEmpty ?? Constants.empty,
      );
}

extension RecipeResponseMapper on RecipeResponse {
  Recipe get toDomain => Recipe(
        id: id.orEmpty,
        fats: fats.orEmpty,
        name: name.orEmpty,
        time: time.orEmpty,
        image: image.orEmpty,
        weeks: weeks.map((e) => e.orEmpty).toList(),
        carbos: carbos.orEmpty,
        fibers: fibers.orEmpty,
        rating: rating.orMinusOne,
        country: country.orEmpty,
        ratings: ratings.orMinusOne,
        calories: calories.orEmpty,
        headline: headline.orEmpty,
        keywords: keywords.map((e) => e.orEmpty).toList(),
        products: products.map((e) => e.orEmpty).toList(),
        proteins: proteins.orEmpty,
        favorites: favorites.orMinusOne,
        difficulty: difficulty.orMinusOne,
        description: description.orEmpty,
        highlighted: highlighted ?? false,
        ingredients: ingredients.map((e) => e.orEmpty).toList(),
        incompatibilities: incompatibilities.orMinusOne,
        deliverableIngredients:
            deliverableIngredients.map((e) => e.orEmpty).toList(),
        undeliverableIngredients:
            undeliverableIngredients.map((e) => e.orEmpty).toList(),
      );
}
